module Atrium
  class PaginationBatch < ::Array
    attr_accessor :total_pages, :total_entries, :current_page, :records_per_page
  end

  module Pageable
    DEFAULT_RECORDS_PER_PAGE = 25

    def pagination_info(endpoint, query_params)
      response = make_get_request(endpoint, query_params.merge(:page => 1))
      response["pagination"]
    end

    def make_get_request(endpoint, query_params)
      uri = endpoint + "?" + ::URI.encode_www_form(query_params)
      ::Atrium.client.make_request(:get, uri)
    end

    def paginate_each(options = {})
      paginate_in_batches(options) do |batch|
        batch.each do |record|
          yield record
        end
      end
    end

    def paginate_in_batches(options = {})
      endpoint = options.fetch(:endpoint)
      resource = options.fetch(:resource)

      query_params = options.fetch(:query_params, {})
      limit = options.fetch(:limit, nil)
      current_page = options.fetch(:initial_page, 1)
      records_per_page = options.fetch(:records_per_page, DEFAULT_RECORDS_PER_PAGE)

      pagination_info_query_params = query_params.merge(:records_per_page => records_per_page)
      pagination = pagination_info(endpoint, pagination_info_query_params)
      total_pages = pagination["total_pages"]
      total_entries = pagination["total_entries"]
      # "total_pages > 1" check exists since some query_params only return 1 page
      total_pages = limit / records_per_page if limit.present? && total_pages > 1

      until current_page > total_pages
        params = query_params.merge(:page => current_page, :records_per_page => records_per_page)
        response = make_get_request(endpoint, params)

        records = response[resource].map { |attributes| new(attributes) }

        batch = ::Atrium::PaginationBatch.new(records)
        batch.total_pages = total_pages
        batch.total_entries = total_entries
        batch.current_page = current_page
        batch.records_per_page = records_per_page
        yield batch

        current_page += 1
      end

      nil
    end
  end
end
