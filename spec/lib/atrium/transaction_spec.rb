require "spec_helper"

RSpec.describe ::Atrium::Transaction do
  let(:raw_transaction) { ::JSON.parse(raw_transaction_response) }
  let(:raw_transactions) { ::JSON.parse(raw_transactions_response) }
  let(:raw_transaction_attributes) {
    {
      :account_guid => "ACT-06d7f44b-caae-0f6e-1384-01f52e75dcb1",
      :amount => 61.11,
      :category => "Groceries",
      :check_number => nil,
      :created_at => "2016-10-06T09:43:42+00:00",
      :date => "2013-09-23",
      :description => "Whole Foods",
      :guid => "TRN-265abee9-889b-af6a-c69b-25157db2bdd9",
      :is_bill_pay => false,
      :is_direct_deposit => false,
      :is_expense => true,
      :is_fee => false,
      :is_income => false,
      :is_overdraft_fee => false,
      :is_payroll_advance => false,
      :latitude => -43.2075,
      :longitude => 139.691706,
      :member_guid => "MBR-7c6f361b-e582-15b6-60c0-358f12466b4b",
      :memo => nil,
      :merchant_category_code => 5411,
      :original_description => "WHOLEFDS TSQ 102",
      :posted_at => "2016-10-07T06:00:00+00:00",
      :status => "POSTED",
      :top_level_category => "Food & Dining",
      :transacted_at => "2016-10-06T13:00:00+00:00",
      :type => "DEBIT",
      :updated_at => "2016-10-07T05:49:12+00:00",
      :user_guid => "USR-fa7537f3-48aa-a683-a02a-b18940482f54"
    }
  }
  let(:raw_transaction_response) {
    { :transaction => raw_transaction_attributes }.to_json
  }
  let(:raw_transactions_response) {
    { :transactions => [raw_transaction_attributes, raw_transaction_attributes] }.to_json
  }
  let(:transaction_guid) { "TRN-265abee9-889b-af6a-c69b-25157db2bdd9" }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(raw_transactions) }

    it "gets a list of transactions" do
      response = described_class.list(:user_guid => user_guid)

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::Transaction)

      expect(response.first.account_guid).to eq(raw_transaction_attributes[:account_guid])
      expect(response.first.amount).to eq(raw_transaction_attributes[:amount])
      expect(response.first.category).to eq(raw_transaction_attributes[:category])
      expect(response.first.check_number).to eq(raw_transaction_attributes[:check_number])
      expect(response.first.created_at).to eq(raw_transaction_attributes[:created_at])
      expect(response.first.date).to eq(raw_transaction_attributes[:date])
      expect(response.first.description).to eq(raw_transaction_attributes[:description])
      expect(response.first.guid).to eq(raw_transaction_attributes[:guid])
      expect(response.first.is_bill_pay).to eq(raw_transaction_attributes[:is_bill_pay])
      expect(response.first.is_direct_deposit).to eq(raw_transaction_attributes[:is_direct_deposit])
      expect(response.first.is_expense).to eq(raw_transaction_attributes[:is_expense])
      expect(response.first.is_fee).to eq(raw_transaction_attributes[:is_fee])
      expect(response.first.is_income).to eq(raw_transaction_attributes[:is_income])
      expect(response.first.is_overdraft_fee).to eq(raw_transaction_attributes[:is_overdraft_fee])
      expect(response.first.is_payroll_advance).to eq(raw_transaction_attributes[:is_payroll_advance])
      expect(response.first.latitude).to eq(raw_transaction_attributes[:latitude])
      expect(response.first.longitude).to eq(raw_transaction_attributes[:longitude])
      expect(response.first.member_guid).to eq(raw_transaction_attributes[:member_guid])
      expect(response.first.memo).to eq(raw_transaction_attributes[:memo])
      expect(response.first.merchant_category_code).to eq(raw_transaction_attributes[:merchant_category_code])
      expect(response.first.original_description).to eq(raw_transaction_attributes[:original_description])
      expect(response.first.posted_at).to eq(raw_transaction_attributes[:posted_at])
      expect(response.first.status).to eq(raw_transaction_attributes[:status])
      expect(response.first.top_level_category).to eq(raw_transaction_attributes[:top_level_category])
      expect(response.first.transacted_at).to eq(raw_transaction_attributes[:transacted_at])
      expect(response.first.type).to eq(raw_transaction_attributes[:type])
      expect(response.first.updated_at).to eq(raw_transaction_attributes[:updated_at])
      expect(response.first.user_guid).to eq(raw_transaction_attributes[:user_guid])
    end
  end

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(raw_transaction) }

    it "gets one transaction" do
      response = described_class.read(:user_guid => user_guid, :transaction_guid =>transaction_guid)

      expect(response).to be_kind_of(::Atrium::Transaction)

      expect(response.account_guid).to eq(raw_transaction_attributes[:account_guid])
      expect(response.amount).to eq(raw_transaction_attributes[:amount])
      expect(response.category).to eq(raw_transaction_attributes[:category])
      expect(response.check_number).to eq(raw_transaction_attributes[:check_number])
      expect(response.created_at).to eq(raw_transaction_attributes[:created_at])
      expect(response.date).to eq(raw_transaction_attributes[:date])
      expect(response.description).to eq(raw_transaction_attributes[:description])
      expect(response.guid).to eq(raw_transaction_attributes[:guid])
      expect(response.is_bill_pay).to eq(raw_transaction_attributes[:is_bill_pay])
      expect(response.is_direct_deposit).to eq(raw_transaction_attributes[:is_direct_deposit])
      expect(response.is_expense).to eq(raw_transaction_attributes[:is_expense])
      expect(response.is_fee).to eq(raw_transaction_attributes[:is_fee])
      expect(response.is_income).to eq(raw_transaction_attributes[:is_income])
      expect(response.is_overdraft_fee).to eq(raw_transaction_attributes[:is_overdraft_fee])
      expect(response.is_payroll_advance).to eq(raw_transaction_attributes[:is_payroll_advance])
      expect(response.latitude).to eq(raw_transaction_attributes[:latitude])
      expect(response.longitude).to eq(raw_transaction_attributes[:longitude])
      expect(response.member_guid).to eq(raw_transaction_attributes[:member_guid])
      expect(response.memo).to eq(raw_transaction_attributes[:memo])
      expect(response.merchant_category_code).to eq(raw_transaction_attributes[:merchant_category_code])
      expect(response.original_description).to eq(raw_transaction_attributes[:original_description])
      expect(response.posted_at).to eq(raw_transaction_attributes[:posted_at])
      expect(response.status).to eq(raw_transaction_attributes[:status])
      expect(response.top_level_category).to eq(raw_transaction_attributes[:top_level_category])
      expect(response.transacted_at).to eq(raw_transaction_attributes[:transacted_at])
      expect(response.type).to eq(raw_transaction_attributes[:type])
      expect(response.updated_at).to eq(raw_transaction_attributes[:updated_at])
      expect(response.user_guid).to eq(raw_transaction_attributes[:user_guid])
    end
  end
end
