module Atrium
  class Transaction
    include ::ActiveAttr

    def self.list(user_guid:)
      endpoint = "/users/#{user_guid}/transactions"
      raw_transactions = ::Atrium.client.make_request(:get, endpoint)

      raw_transactions.map do |raw_transaction|
        ::Atrium::Transaction.new(raw_transaction)
      end
    end

    def self.read(user_guid:, transaction_guid:)
      endpoint = "/users/#{user_guid}/transactions/#{transaction_guid}"
      raw_transaction = ::Atrium.client.make_request(:get, endpoint)

      ::Atrium::Transaction.new(raw_transaction)
    end
  end
end
