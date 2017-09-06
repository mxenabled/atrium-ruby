module Atrium
  class User
    extend ::Atrium::Pageable
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
      endpoint = "/users"
      body = user_body(identifier, is_disabled, metadata)
      response = ::Atrium.client.make_request(:post, endpoint, body)

      user_params = response["user"]
      ::Atrium::User.new(user_params)
    end

    def self.list(options = {})
      options = _user_pagination_options(options)
      paginate(options)
    end

    def self.list_each(options = {})
      options = _user_pagination_options(options)
      paginate_each(options) { |user| yield user }
    end

    def self.list_in_batches(options = {})
      options = _user_pagination_options(options)
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self.read(guid:)
      endpoint = "/users/#{guid}"
      response = ::Atrium.client.make_request(:get, endpoint)

      user_params = response["user"]
      ::Atrium::User.new(user_params)
    end

    ##
    # INSTANCE METHODS
    #
    def accounts(options = {})
      options = _account_pagination_options(options)
      self.class.paginate(options)
    end

    def each_account(options = {})
      options = _account_pagination_options(options)
      self.class.paginate_each(options) { |account| yield account }
    end

    def accounts_in_batches(options = {})
      options = _account_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def delete
      endpoint = "/users/#{guid}"
      ::Atrium.client.make_request(:delete, endpoint)

      self
    end

    def members(options = {})
      options = _member_pagination_options(options)
      self.class.paginate(options)
    end

    def each_member(options = {})
      options = _member_pagination_options(options)
      self.class.paginate_each(options) { |member| yield member }
    end

    def members_in_batches(options = {})
      options = _member_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def transactions(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate(options)
    end

    def each_transaction(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_each(options) { |transaction| yield transaction }
    end

    def transactions_in_batches(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def update(params)
      endpoint = "/users/#{guid}"
      body = update_params(params)
      response = ::Atrium.client.make_request(:put, endpoint, body)

      user_params = response["user"]
      assign_attributes(user_params)
      self
    end

  private

    def _account_pagination_options(options)
      endpoint = "/users/#{guid}/accounts"
      options.merge(:endpoint => endpoint, :resource => "accounts", :klass => ::Atrium::Account)
    end

    def _member_pagination_options(options)
      endpoint = "/users/#{guid}/members"
      options.merge(:endpoint => endpoint, :resource => "members", :klass => ::Atrium::Member)
    end

    def _transaction_pagination_options(options)
      endpoint = "/users/#{guid}/transactions"
      options.merge(:endpoint => endpoint, :resource => "transactions", :klass => ::Atrium::Transaction)
    end

    def update_params(params)
      {
        :user => params
      }
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
    private_class_method :user_body

    def self._user_pagination_options(options)
      options.merge(:endpoint => "/users", :resource => "users")
    end
  end
end
