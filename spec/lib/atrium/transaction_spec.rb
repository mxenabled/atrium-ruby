require "spec_helper"

describe ::Atrium::Transaction do
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
    {
      :transaction => raw_transaction_attributes
    }.to_json
  }
  let(:raw_transactions_response) {
    {
      :transactions => [raw_transaction_attributes, raw_transaction_attributes]
    }.to_json
  }
  let(:transaction_guid) { "TRN-265abee9-889b-af6a-c69b-25157db2bdd9" }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(raw_transactions) }

    it "gets a list of transactions" do
      response = described_class.list(:user_guid => user_guid)

      expect(response).to be_kind_of(::Array)
      expect(response.first).to be_kind_of(::Atrium::Transaction)

      expect(response.first.account_guid).to eq("ACT-06d7f44b-caae-0f6e-1384-01f52e75dcb1")
      expect(response.first.amount).to eq(61.11)
      expect(response.first.category).to eq("Groceries")
      expect(response.first.check_number).to eq(nil)
      expect(response.first.created_at).to eq("2016-10-06T09:43:42+00:00")
      expect(response.first.date).to eq("2013-09-23")
      expect(response.first.description).to eq("Whole Foods")
      expect(response.first.guid).to eq("TRN-265abee9-889b-af6a-c69b-25157db2bdd9")
      expect(response.first.is_bill_pay).to eq(false)
      expect(response.first.is_direct_deposit).to eq(false)
      expect(response.first.is_expense).to eq(true)
      expect(response.first.is_fee).to eq(false)
      expect(response.first.is_income).to eq(false)
      expect(response.first.is_overdraft_fee).to eq(false)
      expect(response.first.is_payroll_advance).to eq(false)
      expect(response.first.latitude).to eq(-43.2075)
      expect(response.first.longitude).to eq(139.691706)
      expect(response.first.member_guid).to eq("MBR-7c6f361b-e582-15b6-60c0-358f12466b4b")
      expect(response.first.memo).to eq(nil)
      expect(response.first.merchant_category_code).to eq(5411)
      expect(response.first.original_description).to eq("WHOLEFDS TSQ 102")
      expect(response.first.posted_at).to eq("2016-10-07T06:00:00+00:00")
      expect(response.first.status).to eq("POSTED")
      expect(response.first.top_level_category).to eq("Food & Dining")
      expect(response.first.transacted_at).to eq("2016-10-06T13:00:00+00:00")
      expect(response.first.type).to eq("DEBIT")
      expect(response.first.updated_at).to eq("2016-10-07T05:49:12+00:00")
      expect(response.first.user_guid).to eq("USR-fa7537f3-48aa-a683-a02a-b18940482f54")
    end
  end

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(raw_transaction) }

    it "gets one transaction" do
      response = described_class.read(:user_guid => user_guid, :transaction_guid =>transaction_guid)

      expect(response).to be_kind_of(::Atrium::Transaction)

      expect(response.account_guid).to eq("ACT-06d7f44b-caae-0f6e-1384-01f52e75dcb1")
      expect(response.amount).to eq(61.11)
      expect(response.category).to eq("Groceries")
      expect(response.check_number).to eq(nil)
      expect(response.created_at).to eq("2016-10-06T09:43:42+00:00")
      expect(response.date).to eq("2013-09-23")
      expect(response.description).to eq("Whole Foods")
      expect(response.guid).to eq("TRN-265abee9-889b-af6a-c69b-25157db2bdd9")
      expect(response.is_bill_pay).to eq(false)
      expect(response.is_direct_deposit).to eq(false)
      expect(response.is_expense).to eq(true)
      expect(response.is_fee).to eq(false)
      expect(response.is_income).to eq(false)
      expect(response.is_overdraft_fee).to eq(false)
      expect(response.is_payroll_advance).to eq(false)
      expect(response.latitude).to eq(-43.2075)
      expect(response.longitude).to eq(139.691706)
      expect(response.member_guid).to eq("MBR-7c6f361b-e582-15b6-60c0-358f12466b4b")
      expect(response.memo).to eq(nil)
      expect(response.merchant_category_code).to eq(5411)
      expect(response.original_description).to eq("WHOLEFDS TSQ 102")
      expect(response.posted_at).to eq("2016-10-07T06:00:00+00:00")
      expect(response.status).to eq("POSTED")
      expect(response.top_level_category).to eq("Food & Dining")
      expect(response.transacted_at).to eq("2016-10-06T13:00:00+00:00")
      expect(response.type).to eq("DEBIT")
      expect(response.updated_at).to eq("2016-10-07T05:49:12+00:00")
      expect(response.user_guid).to eq("USR-fa7537f3-48aa-a683-a02a-b18940482f54")
    end
  end
end
