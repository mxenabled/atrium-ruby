require "URI"

module Atrium
  module Paginate
    DEFAULT_PAGE = 1
    DEFAULT_RECORDS_PER_PAGE = 25
    DEFAULT_TOTAL_PAGES = 1

    attr_accessor :current_page, :endpoint, :klass_name, :per_page, :total_pages

    def endpoint_name(query_params = nil)
      set_klass_name

      if query_params.present?
        @endpoint = klass_name + "?" + URI.encode_www_form(query_params) + "&"
      else
        @endpoint = klass_name + "?"
      end
    end

    def paginate_endpoint(query_params = nil)
      endpoint_name(query_params)
      set_pagination_fields
      response_list
    end

    def response_list
      list = []

      until current_page > total_pages
        paginated_endpoint =  endpoint + "page=#{current_page}&records_per_page=#{per_page}"
        response = ::Atrium.client.make_request(:get, paginated_endpoint)

        # Add new objects to the list
        response["#{klass_name}"].map do |params|
          list << self.new(params)
        end
        @current_page += 1
      end
      list
    end

    def set_klass_name
      @klass_name ||= self.name.gsub("Atrium::", "").downcase.pluralize
    end

    def set_pagination_fields
      response = ::Atrium.client.make_request(:get, klass_name)

      pagination = response["pagination"]
      @current_page  = pagination["current_page"] || DEFAULT_PAGE
      @per_page  = pagination["per_page"] || DEFAULT_RECORDS_PER_PAGE
      @total_pages  = pagination["total_pages"] || DEFAULT_TOTAL_PAGES
    end
  end
end
