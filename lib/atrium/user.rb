module Atrium
  class User
    include ::ActiveAttr::Model

    # ATTRIBUTES
    attribute :guid
    attribute :identifier
    attribute :is_disabled
    attribute :metadata

    ##
    # CLASS METHODS
    #
    def self.create(identifier:, is_disabled:, metadata:)
      endpoint = '/users'
      body = user_body(identifier, is_disabled, metadata)
      response = ::Atrium.client.make_request(:post, endpoint, body)

      user_params = response['user']
      ::Atrium::User.new(user_params)
    end

    def self.list
      endpoint = '/users'
      users_response = ::Atrium.client.make_request(:get, endpoint)

      users_response['users'].map do |user|
        ::Atrium::User.new(user)
      end
    end

    def self.read(guid:)
      endpoint = "/users/#{guid}"
      response = ::Atrium.client.make_request(:get, endpoint)

      user_params = response['user']
      ::Atrium::User.new(user_params)
    end

    ##
    # INSTANCE METHODS
    #
    def accounts
      endpoint = "/users/#{guid}/accounts"
      response = ::Atrium.client.make_request(:get, endpoint)

      response['accounts'].map do |account|
        ::Atrium::Account.new(account)
      end
    end

    def delete
      endpoint = "/users/#{guid}"
      ::Atrium.client.make_request(:delete, endpoint)

      self
    end

    def members
      endpoint = "/users/#{guid}/members"
      response = ::Atrium.client.make_request(:get, endpoint)

      response['members'].map do |member|
        ::Atrium::Member.new(member)
      end
    end

    def transactions
      endpoint = "/users/#{guid}/transactions"
      response = ::Atrium.client.make_request(:get, endpoint)

      response['transactions'].map do |transaction|
        ::Atrium::Transaction.new(transaction)
      end
    end

    def update(params)
      endpoint = "/users/#{guid}"
      body = update_params(params)
      response = ::Atrium.client.make_request(:put, endpoint, body)

      user_params = response['user']
      assign_attributes(user_params)
      self
    end

    private

    def update_params(params)
      {
        user: params
      }
    end

    def self.user_body(identifier, is_disabled, metadata)
      {
        user: {
          identifier: identifier,
          is_disabled: is_disabled,
          metadata: metadata
        }
      }
    end
    private_class_method :user_body
  end
end
