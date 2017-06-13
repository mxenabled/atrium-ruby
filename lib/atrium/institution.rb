module Atrium
  class Institution
    extend ::Atrium::Paginate
    include ::ActiveAttr::Model

    attribute :code
    attribute :medium_logo_url
    attribute :name
    attribute :small_logo_url
    attribute :url

    def self.credentials(institution_code)
      endpoint = "/institutions/#{institution_code}/credentials"
      response = ::Atrium.client.make_request(:get, endpoint)

      response['credentials'].map do |credential|
        ::Atrium::Credential.new(credential)
      end
    end

    def self.list(query_params: nil, limit: nil)
      paginate_endpoint(query_params: query_params, limit: limit)
    end

    def self.list_in_batches(query_params: nil, limit: nil, &block)
      paginate_endpoint_in_batches(query_params: query_params, limit: limit, &block)
    end
  end
end
