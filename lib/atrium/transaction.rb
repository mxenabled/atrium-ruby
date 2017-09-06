require "atrium/pageable"

module Atrium
  class Transaction
    extend ::Atrium::Pageable
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
      raw_transactions = ::Atrium.client.make_request(:get, base_endpoint(user_guid))

      raw_transactions["transactions"].map do |raw_transaction|
        ::Atrium::Transaction.new(raw_transaction)
      end
    end

    def self.list_in_batches(options = {})
      user_guid = options.fetch(:user_guid)
      endpoint = "/users/#{user_guid}/transactions"
      options = options.merge(:endpoint => endpoint, :resource => "transactions")
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self.read(user_guid:, transaction_guid:)
      endpoint = ::URI.join(base_endpoint(user_guid), "#{transaction_guid}")
      raw_transaction = ::Atrium.client.make_request(:get, endpoint)

      ::Atrium::Transaction.new(raw_transaction["transaction"])
    end

    def self.base_endpoint(user_guid:)
      "/users/#{user_guid}/transactions"
    end
  end
end
