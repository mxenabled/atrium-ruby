module Atrium
  class Institution
    extend ::Atrium::Paginate
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

    def self.format_endpoint(endpoint, options = nil)
      if options.present?
        endpoint + "?" + URI.encode_www_form(options)
      else
        endpoint
      end
    end

    def self.list(options = nil)
      paginate_endpoint(options)
    end
  end
end
