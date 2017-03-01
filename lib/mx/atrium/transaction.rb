module MX
  module Atrium
    class Transaction
      include ::ActiveAttr::Model

      attribute :account_guid
      attribute :amount
      attribute :category
      attribute :check_number
      attribute :created_at
      attribute :date
      attribute :description
      attribute :guid
      attribute :is_bill_pay
      attribute :is_direct_deposit
      attribute :is_expense
      attribute :is_fee
      attribute :is_income
      attribute :is_overdraft_fee
      attribute :is_payroll_advance
      attribute :latitude
      attribute :longitude
      attribute :member_guid
      attribute :memo
      attribute :merchant_category_code
      attribute :original_description
      attribute :posted_at
      attribute :status
      attribute :top_level_category
      attribute :transacted_at
      attribute :type
      attribute :updated_at
      attribute :user_guid

      def self.list(user_guid:)
        endpoint = "/users/#{user_guid}/transactions"
        raw_transactions = ::MX::Atrium.client.make_request(:get, endpoint)

        raw_transactions["transactions"].map do |raw_transaction|
          ::MX::Atrium::Transaction.new(raw_transaction)
        end
      end

      def self.read(user_guid:, transaction_guid:)
        endpoint = "/users/#{user_guid}/transactions/#{transaction_guid}"
        raw_transaction = ::MX::Atrium.client.make_request(:get, endpoint)

        ::MX::Atrium::Transaction.new(raw_transaction["transaction"])
      end
    end
  end
end
