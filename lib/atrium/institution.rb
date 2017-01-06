module Atrium
  class Institution
    include ::ActiveAttr::Model

    attribute :code
    attribute :name
    attribute :url

    def self.credentials(institution_code)
      ::Atrium.client.make_request(:get, "/institutions/#{institution_code}/credentials")
    end
    
    ##
    # GET /institutions
    #
    def self.list
      ::Atrium.client.make_request(:get, "/institutions")
    end
  end
end
