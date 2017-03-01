module MX
  module Atrium
    class Institution
      extend ::MX::Atrium::Paginate
      include ::ActiveAttr::Model

      attribute :code
      attribute :name
      attribute :url

      def self.credentials(institution_code)
        endpoint = "/institutions/#{institution_code}/credentials"
        response = ::MX::Atrium.client.make_request(:get, endpoint)

        response["credentials"].map do |credential|
          ::MX::Atrium::Credential.new(credential)
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
end
