module Atrium
  class Account
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

    # ::Atrium::Account.list(:user_guid => user_guid)
    def self.list(user_guid:)
      endpoint = "/users/#{user_guid}/accounts"
      accounts_response = ::Atrium.client.make_request(:get, endpoint)

      accounts = accounts_response["accounts"].map do |account|
        ::Atrium::Account.new(account)
      end
    end

    # ::Atrium::Account.read(:user_guid => user_guid, :account_guid => account_guid)
    def self.read(user_guid:, account_guid:)
      endpoint = "/users/#{user_guid}/accounts/#{account_guid}"
      account_response = ::Atrium.client.make_request(:get, endpoint)

      account_params = account_response["account"]
      ::Atrium::Account.new(account_params)
    end

    # account.transactions
    def transactions
      endpoint = "/users/#{self.user_guid}/accounts/#{self.guid}/transactions"
      account_transactions_response = ::Atrium.client.make_request(:get, endpoint)

      transactions = account_transactions_response["transactions"].map do |transaction|
        ::Atrium::Transaction.new(transaction)
      end
    end
  end
end
