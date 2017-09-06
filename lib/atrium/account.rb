module Atrium
  class Account
    extend ::Atrium::Pageable
    include ::ActiveAttr::Model

    # ATTRIBUTES
    attribute :apr
    attribute :apy
    attribute :available_balance
    attribute :available_credit
    attribute :balance
    attribute :created_at
    attribute :credit_limit
    attribute :day_payment_is_due
    attribute :guid
    attribute :institution_code
    attribute :interest_rate
    attribute :is_closed
    attribute :last_payment
    attribute :last_payment_at
    attribute :matures_on
    attribute :member_guid
    attribute :minimum_balance
    attribute :minimum_payment
    attribute :name
    attribute :original_balance
    attribute :payment_due_at
    attribute :payoff_balance
    attribute :started_on
    attribute :subtype
    attribute :total_account_value
    attribute :type
    attribute :updated_at
    attribute :user_guid

    def self.list(options = {})
      options = _account_pagination_options(options)
      paginate(options)
    end

    def self.list_each(options = {})
      options = _account_pagination_options(options)
      paginate_each(options) { |account| yield account }
    end

    def self.list_in_batches(options = {})
      options = _account_pagination_options(options)
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self.read(user_guid:, account_guid:)
      endpoint = "/users/#{user_guid}/accounts/#{account_guid}"
      account_response = ::Atrium.client.make_request(:get, endpoint)

      account_params = account_response["account"]
      ::Atrium::Account.new(account_params)
    end

    def transactions(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate(options)
    end

    def each_transaction(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_each(options) { |account| yield account }
    end

    def transactions_in_batches(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def self._account_pagination_options(options)
      user_guid = options.fetch(:user_guid)
      endpoint = "/users/#{user_guid}/accounts"
      options.merge(:endpoint => endpoint, :resource => "accounts")
    end

  private

    def _transaction_pagination_options(options)
      endpoint = "/users/#{user_guid}/accounts/#{guid}/transactions"
      options.merge(:endpoint => endpoint, :resource => "transactions", :klass => ::Atrium::Transaction)
    end
  end
end
