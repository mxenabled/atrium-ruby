require "URI"

module Atrium
  module Paginate
    DEFAULT_PAGE = 1
    DEFAULT_RECORDS_PER_PAGE = 25
    DEFAULT_TOTAL_PAGES = 1

    attr_accessor :current_page, :klass_name, :per_page, :total_pages

    def endpoint_name
      @klass_name ||= self.name.gsub("Atrium::", "").downcase.pluralize
    end

    def paginate_endpoint(options = nil)
      endpoint_name
      set_pagination_fields_from_initial_request(endpoint_name, options)
      list = []

      until current_page > total_pages
        endpoint = "#{klass_name}?page=#{current_page}&records_per_page=#{per_page}"
        response = ::Atrium.client.make_request(:get, endpoint)

        # Add new objects to the list
        response["#{klass_name}"].map do |params|
          list << self.new(params)
        end
        @current_page += 1
      end
      list
    end

    def set_pagination_fields(response)
      pagination = response["pagination"]
      @current_page  = pagination["current_page"] || DEFAULT_PAGE
      @per_page  = pagination["per_page"] || DEFAULT_RECORDS_PER_PAGE
      @total_pages  = pagination["total_pages"] || DEFAULT_TOTAL_PAGES
    end

    # TODO: add options for this!
    def set_pagination_fields_from_initial_request(endpoint, options = nil)
      response = ::Atrium.client.make_request(:get, endpoint)
      set_pagination_fields(response)
    end
  end
end
