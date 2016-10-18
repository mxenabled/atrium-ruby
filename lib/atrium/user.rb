module Atrium
  class User
    ##
    # GET /users/:user_guid/members
    #
    def self.accounts(user_guid)
      endpoint = "/users/#{user_guid}/accounts"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # POST /users
    #
    def self.create(identifier = "", is_disabled = false, metadata = nil)
      endpoint = "/users"
      body = user_body(identifier, is_disabled, metadata)
      ::Atrium.client.make_request(:post, endpoint, body)
    end

    ##
    # DELETE /users/:guid
    #
    def self.delete(guid)
      endpoint = "/users/#{guid}"
      ::Atrium.client.make_request(:delete, endpoint)
      true
    end

    ##
    # GET /users/:user_guid/members
    #
    def self.members(user_guid)
      endpoint = "/users/#{user_guid}/members"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # GET /users/:guid
    #
    def self.read(guid)
      endpoint = "/users/#{guid}"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # GET /users/:user_guid/members
    #
    def self.transactions(user_guid)
      endpoint = "/users/#{user_guid}/transactions"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # PUT /users/:guid
    #
    def self.update(guid, identifier = "", is_disabled = false, metadata = nil)
      endpoint = "/users/#{guid}"
      body = user_body(identifier, is_disabled, metadata)
      ::Atrium.client.make_request(:put, endpoint, body)
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
