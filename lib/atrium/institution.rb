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

    end
    
    ##
    # GET /institutions
    #
    def self.list
      ::Atrium.client.make_request(:get, "/institutions")
    end
  end
end
