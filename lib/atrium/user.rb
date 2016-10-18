module Atrium
  class User
    ##
    # POST /users
    #
    def self.create(identifier = "", is_disabled = false, metadata = nil)
      endpoint = "/users"
      body = user_body(identifier, is_disabled, metadata)
      header = { "Content-Type" => "application/json" }
      ::Atrium.client.make_request(:post, endpoint, body, header)
    end

    ##
    # DELETE /users/:guid
    #
    def self.delete(guid)
      endpoint = "/users/#{guid}"
      ::Atrium.client.make_request(:delete, endpoint)
    end

    ##
    # GET /users/:guid
    #
    def self.read(guid)
      endpoint = "/users/#{guid}"
      response = ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # PUT /users/:guid
    #
    def self.update(guid, identifier = "", is_disabled = false, metadata = nil)
      endpoint = "/users/#{guid}"
      body = user_body(identifier, is_disabled, metadata)
      header = { "Content-Type" => "application/json" }
      ::Atrium.client.make_request(:put, endpoint, body, header)
    end

    def self.user_body(identifier, is_disabled, metadata)
      {
        :user => {
          :identifier => identifier,
          :is_disabled => is_disabled,
          :metadata => metadata
        }
      }
    end
  end
end
