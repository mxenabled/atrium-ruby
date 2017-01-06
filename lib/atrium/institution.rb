module Atrium
  class Institution
    include ::ActiveAttr::Model

    attribute :code
    attribute :name
    attribute :url

    def self.credentials(institution_code)
      endpoint = "/institutions/#{institution_code}/credentials"
      response = ::Atrium.client.make_request(:get, endpoint)

      response["credentials"].map do |credential|
        ::Atrium::Credential.new(credential)
      end
    end

    def self.list(options = nil)
      endpoint = format_endpoint("institutions", options)
      ::Atrium.client.make_request(:get, endpoint)
    end

    def self.format_endpoint(endpoint_name, options = nil)
      if options.present?
        endpoint + pagination_params(options)
      else
        endpoint
      end
    end

    def self.query_params(options)
      query_params = ""

      options.each do |param_name, value|
        format_query = "&#{param_name.to_s}=#{value.to_s}"
        query_params += format_query
      end

      query_params
    end
    private_class_method :format_endpoint, :pagination_params
  end
end
