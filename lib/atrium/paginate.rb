require "URI"

module Atrium
  module Paginate
    DEFAULT_RECORDS_PER_PAGE = 25
    INITIAL_PAGE = 1

    attr_accessor :current_page, :endpoint, :total_pages

    def endpoint_name(query_params: nil)
      @endpoint = if query_params.present?
         klass_name + "?" + URI.encode_www_form(query_params) + "&"
      else
        klass_name + "?"
      end
    end

    def get_total_pages
      @current_page = INITIAL_PAGE

      paginated_endpoint = endpoint + "page=#{current_page}&records_per_page=#{records_per_page}"
      response = ::Atrium.client.make_request(:get, paginated_endpoint)

      pagination = response["pagination"]
      @total_pages  = pagination["total_pages"]
    end

    def klass_name
      @klass_name ||= self.name.gsub("Atrium::", "").downcase.pluralize
    end

    def paginate_endpoint(query_params: nil, limit: nil)
      endpoint_name(query_params: query_params)
      get_total_pages
      response_list(limit: limit)
    end

    def paginate_endpoint_in_batches(query_params: nil, limit: nil, &block)
      return "method requires block to be passed" unless block_given?

      endpoint_name(query_params: query_params)
      get_total_pages
      response_list_in_batches(limit: limit, &block)
    end

    def records_per_page
      @records_per_page ||= DEFAULT_RECORDS_PER_PAGE
    end

    def response_list(limit: nil)
      # "total_pages > 1" check exists since some query_params only return 1 page
      @total_pages = limit / records_per_page if limit.present? && total_pages > 1
      list = []

      until current_page > total_pages
        paginated_endpoint =  endpoint + "page=#{current_page}&records_per_page=#{records_per_page}"
        response = ::Atrium.client.make_request(:get, paginated_endpoint)

        # Add new objects to the list
        response["#{klass_name}"].each do |params|
          list << self.new(params)
        end
        @current_page += 1
      end
      list
    end

    def response_list_in_batches(limit: nil, &block)
      # "total_pages > 1" check exists since some query_params only return 1 page
      @total_pages = limit / records_per_page if limit.present? && total_pages > 1

      until current_page > total_pages
        paginated_endpoint =  endpoint + "page=#{current_page}&records_per_page=#{records_per_page}"
        response = ::Atrium.client.make_request(:get, paginated_endpoint)
        list = []

        response["#{klass_name}"].each do |params|
          list << self.new(params)
        end
        @current_page += 1
        yield list
      end
    end
  end
end
