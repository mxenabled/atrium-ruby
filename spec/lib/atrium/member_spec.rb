require "spec_helper"

describe ::Atrium::Member do
  let(:credentials) {
    [
      { :guid => "CRD-123", :value => "user_name" },
      { :guid => "CRD-456", :value => "password" }
    ]
  }
  let(:member) { ::Atrium::Member.new(member_attributes) }
  let(:member_response) { ::JSON.parse(raw_member_response)}
  let(:members_response) { ::JSON.parse(raw_members_response)}
  let(:member_attributes) do
    {
      :aggregated_at => "2016-10-13T18:07:57+00:00",
      :guid => "MBR-7c6f361b-e582-15b6-60c0-358f12466b4b",
      :identifier => "unique_id",
      :institution_code => "chase",
      :metadata => "{\"credentials_last_refreshed_at\": \"2015-10-15\"}",
      :name => "Chase Bank",
      :status => "COMPLETED",
      :successfully_aggregated_at => "2016-10-13T17:57:38+00:00",
      :user_guid => "USR-fa7537f3-48aa-a683-a02a-b18940482f54"
    }
  end

  let(:raw_member_response) {
    { :member => member_attributes }.to_json
  }
  let(:raw_members_response) {
    { :members => [member_attributes, member_attributes]}.to_json
  }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".create" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(member_response) }
    let(:institution_code) { "chase" }

    it "should create a new member" do
      response = ::Atrium::Member.create(:user_guid => member_attributes[:user_guid], :institution_code => institution_code, :credentials => credentials)

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::Member)

      expect(response.aggregated_at).to eq(member_attributes[:aggregated_at])
      expect(response.guid).to eq(member_attributes[:guid])
      expect(response.identifier).to eq(member_attributes[:identifier])
      expect(response.institution_code).to eq(member_attributes[:institution_code])
      expect(response.metadata).to eq(member_attributes[:metadata])
      expect(response.name).to eq(member_attributes[:name])
      expect(response.status).to eq(member_attributes[:status])
      expect(response.successfully_aggregated_at).to eq(member_attributes[:successfully_aggregated_at])
      expect(response.user_guid).to eq(member_attributes[:user_guid])
    end
  end

  describe "member accounts" do
    let(:account_attributes) do
      {
        :apr => 3.4,
        :apy => 3.5,
        :available_balance => 20000,
        :available_credit => 15000,
        :balance => 25_000,
        :created_at => "2016-10-06T09:43:4200:00",
        :credit_limit => 5000,
        :day_payment_is_due => "2016-10-06T09:43:4200:00",
        :guid => "ACT-06d7f44b",
        :institution_code => "chase",
        :interest_rate => 5.04,
        :is_closed => false,
        :last_payment => "2016-10-06T09:43:4200:00",
        :last_payment_at => "2016-10-06T09:43:4200:00",
        :matures_on => "2016-10-06T09:43:4200:00",
        :member_guid => "MBR",
        :minimum_balance => 2000,
        :minimum_payment => 30.00,
        :name => "CHASE CHECKING",
        :original_balance => 40000,
        :payment_due_at => "2016-10-06T09:43:4200:00",
        :payoff_balance => 4000,
        :started_on => "2016-10-06T09:43:4200:00",
        :subtype => 2,
        :total_account_value => 10000,
        :type => 1,
        :updated_at => "2016-10-06T09:43:4200:00",
        :user_guid => user_guid,
      }
    end
    let(:account_response) { ::JSON.parse(raw_account_response)}
    let(:accounts_response) { ::JSON.parse(raw_accounts_response)}
    let(:raw_account_response) {
      { :account => account_attributes }.to_json
    }
    let(:raw_accounts_response) {
      { :accounts => [account_attributes, account_attributes]}.to_json
    }

    context "#accounts" do
      before { allow(::Atrium.client).to receive(:make_request).and_return(accounts_response) }

      it "should return accounts for member" do
        response = member.accounts

        expect(response).to be_kind_of(::Array)
        expect(response.length).to eq(2)
        expect(response.first).to be_kind_of(::Atrium::Account)

        expect(response.first.apr).to eq(account_attributes[:apr])
        expect(response.first.apy).to eq(account_attributes[:apy])
        expect(response.first.available_balance).to eq(account_attributes[:available_balance])
        expect(response.first.available_credit).to eq(account_attributes[:available_credit])
        expect(response.first.balance).to eq(account_attributes[:balance])
        expect(response.first.created_at).to eq(account_attributes[:created_at])
        expect(response.first.credit_limit).to eq(account_attributes[:credit_limit])
        expect(response.first.day_payment_is_due).to eq(account_attributes[:day_payment_is_due])
        expect(response.first.guid).to eq(account_attributes[:guid])
        expect(response.first.institution_code).to eq(account_attributes[:institution_code])
        expect(response.first.interest_rate).to eq(account_attributes[:interest_rate])
        expect(response.first.is_closed).to eq(account_attributes[:is_closed])
        expect(response.first.last_payment).to eq(account_attributes[:last_payment])
        expect(response.first.last_payment_at).to eq(account_attributes[:last_payment_at])
        expect(response.first.matures_on).to eq(account_attributes[:matures_on])
        expect(response.first.member_guid).to eq(account_attributes[:member_guid])
        expect(response.first.minimum_balance).to eq(account_attributes[:minimum_balance])
        expect(response.first.minimum_payment).to eq(account_attributes[:minimum_payment])
        expect(response.first.name).to eq(account_attributes[:name])
        expect(response.first.original_balance).to eq(account_attributes[:original_balance])
        expect(response.first.payment_due_at).to eq(account_attributes[:payment_due_at])
        expect(response.first.payoff_balance).to eq(account_attributes[:payoff_balance])
        expect(response.first.started_on).to eq(account_attributes[:started_on])
        expect(response.first.subtype).to eq(account_attributes[:subtype])
        expect(response.first.total_account_value).to eq(account_attributes[:total_account_value])
        expect(response.first.type).to eq(account_attributes[:type])
        expect(response.first.updated_at).to eq(account_attributes[:updated_at])
        expect(response.first.user_guid).to eq(account_attributes[:user_guid])
       end
    end

    context "#read_account" do
      before { allow(::Atrium.client).to receive(:make_request).and_return(account_response) }

      it "should return account for member" do
        response = member.read_account(:account_guid => account_attributes[:guid])

        expect(response).to be_kind_of(::Object)
        expect(response).to be_kind_of(::Atrium::Account)

        expect(response.apr).to eq(account_attributes[:apr])
        expect(response.apy).to eq(account_attributes[:apy])
        expect(response.available_balance).to eq(account_attributes[:available_balance])
        expect(response.available_credit).to eq(account_attributes[:available_credit])
        expect(response.balance).to eq(account_attributes[:balance])
        expect(response.created_at).to eq(account_attributes[:created_at])
        expect(response.credit_limit).to eq(account_attributes[:credit_limit])
        expect(response.day_payment_is_due).to eq(account_attributes[:day_payment_is_due])
        expect(response.guid).to eq(account_attributes[:guid])
        expect(response.institution_code).to eq(account_attributes[:institution_code])
        expect(response.interest_rate).to eq(account_attributes[:interest_rate])
        expect(response.is_closed).to eq(account_attributes[:is_closed])
        expect(response.last_payment).to eq(account_attributes[:last_payment])
        expect(response.last_payment_at).to eq(account_attributes[:last_payment_at])
        expect(response.matures_on).to eq(account_attributes[:matures_on])
        expect(response.member_guid).to eq(account_attributes[:member_guid])
        expect(response.minimum_balance).to eq(account_attributes[:minimum_balance])
        expect(response.minimum_payment).to eq(account_attributes[:minimum_payment])
        expect(response.name).to eq(account_attributes[:name])
        expect(response.original_balance).to eq(account_attributes[:original_balance])
        expect(response.payment_due_at).to eq(account_attributes[:payment_due_at])
        expect(response.payoff_balance).to eq(account_attributes[:payoff_balance])
        expect(response.started_on).to eq(account_attributes[:started_on])
        expect(response.subtype).to eq(account_attributes[:subtype])
        expect(response.total_account_value).to eq(account_attributes[:total_account_value])
        expect(response.type).to eq(account_attributes[:type])
        expect(response.updated_at).to eq(account_attributes[:updated_at])
        expect(response.user_guid).to eq(account_attributes[:user_guid])
      end
    end
  end

  describe "#aggregate" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(member_response) }

    it "should aggregate & return a member" do
      response = member.aggregate

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::Member)

      expect(response.aggregated_at).to eq(member_attributes[:aggregated_at])
      expect(response.guid).to eq(member_attributes[:guid])
      expect(response.identifier).to eq(member_attributes[:identifier])
      expect(response.institution_code).to eq(member_attributes[:institution_code])
      expect(response.metadata).to eq(member_attributes[:metadata])
      expect(response.name).to eq(member_attributes[:name])
      expect(response.status).to eq(member_attributes[:status])
      expect(response.successfully_aggregated_at).to eq(member_attributes[:successfully_aggregated_at])
      expect(response.user_guid).to eq(member_attributes[:user_guid])
    end
  end

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(members_response) }

    it "should return list of members" do
      response = described_class.list(:user_guid => user_guid)

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::Member)

      expect(response.first.aggregated_at).to eq(member_attributes[:aggregated_at])
      expect(response.first.guid).to eq(member_attributes[:guid])
      expect(response.first.identifier).to eq(member_attributes[:identifier])
      expect(response.first.institution_code).to eq(member_attributes[:institution_code])
      expect(response.first.metadata).to eq(member_attributes[:metadata])
      expect(response.first.name).to eq(member_attributes[:name])
      expect(response.first.status).to eq(member_attributes[:status])
      expect(response.first.successfully_aggregated_at).to eq(member_attributes[:successfully_aggregated_at])
      expect(response.first.user_guid).to eq(member_attributes[:user_guid])
    end
  end

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(member_response) }

    it "should return member" do
      response = described_class.read(:user_guid => user_guid, :member_guid => member_attributes[:guid])

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::Member)

      expect(response.aggregated_at).to eq(member_attributes[:aggregated_at])
      expect(response.guid).to eq(member_attributes[:guid])
      expect(response.identifier).to eq(member_attributes[:identifier])
      expect(response.institution_code).to eq(member_attributes[:institution_code])
      expect(response.metadata).to eq(member_attributes[:metadata])
      expect(response.name).to eq(member_attributes[:name])
      expect(response.status).to eq(member_attributes[:status])
      expect(response.successfully_aggregated_at).to eq(member_attributes[:successfully_aggregated_at])
      expect(response.user_guid).to eq(member_attributes[:user_guid])
    end
  end

  describe "resume" do
    let(:challenged_member_params) {
      {
        :aggregated_at => "2016-10-13T18:07:57+00:00",
        :guid => "MBR-7c6f361b-e582-15b6-60c0-358f12466b4b",
        :identifier => "unique_id",
        :institution_code => "chase",
        :metadata => "{\"credentials_last_refreshed_at\": \"2015-10-15\"}",
        :name => "Chase Bank",
        :status => "CHALLENGED",
        :successfully_aggregated_at => "2016-10-13T17:57:38+00:00",
        :user_guid => "USR-fa7537f3-48aa-a683-a02a-b18940482f54"
      }
    }
    let(:challenged_member) { ::Atrium::Member.new(challenged_member_params) }

    before { allow(::Atrium.client).to receive(:make_request).and_return(member_response) }

    it "should return updated member" do
      response = challenged_member.resume(credentials)

      expect(response.aggregated_at).to eq(member_attributes[:aggregated_at])
      expect(response.guid).to eq(member_attributes[:guid])
      expect(response.identifier).to eq(member_attributes[:identifier])
      expect(response.institution_code).to eq(member_attributes[:institution_code])
      expect(response.metadata).to eq(member_attributes[:metadata])
      expect(response.name).to eq(member_attributes[:name])
      expect(response.status).to eq(member_attributes[:status])
      expect(response.successfully_aggregated_at).to eq(member_attributes[:successfully_aggregated_at])
      expect(response.user_guid).to eq(member_attributes[:user_guid])
    end
  end

  describe "transactions" do
    let(:member_transactions_response) { ::JSON.parse(raw_member_transactions_response) }
    let(:transaction_attributes) do
      {
        :member_guid => member_attributes[:guid],
        :amount => 61.11,
        :category => "Groceries",
        :check_number => nil,
        :created_at => "2016-10-06T09:43:4200:00",
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
        :posted_at => "2016-10-07T06:00:0000:00",
        :status => "POSTED",
        :top_level_category => "Food & Dining",
        :transacted_at => "2016-10-06T13:00:0000:00",
        :type => "DEBIT",
        :updated_at => "2016-10-07T05:49:1200:00",
        :user_guid => "USR-fa7537f3-48aa-a683-a02a-b18940482f54"
      }
    end

    let(:raw_member_transactions_response) {
      { :transactions => [transaction_attributes, transaction_attributes] }.to_json
    }

    before {
      allow(::Atrium.client).to receive(:make_request).and_return(member_transactions_response)
    }

    it "returns list of transactions for member" do
      response = member.transactions

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::Transaction)

      expect(response.first.member_guid).to eq(transaction_attributes[:member_guid])
      expect(response.first.amount).to eq(transaction_attributes[:amount])
      expect(response.first.category).to eq(transaction_attributes[:category])
      expect(response.first.check_number).to eq(transaction_attributes[:check_number])
      expect(response.first.created_at).to eq(transaction_attributes[:created_at])
      expect(response.first.date).to eq(transaction_attributes[:date])
      expect(response.first.description).to eq(transaction_attributes[:description])
      expect(response.first.guid).to eq(transaction_attributes[:guid])
      expect(response.first.is_bill_pay).to eq(transaction_attributes[:is_bill_pay])
      expect(response.first.is_direct_deposit).to eq(transaction_attributes[:is_direct_deposit])
      expect(response.first.is_expense).to eq(transaction_attributes[:is_expense])
      expect(response.first.is_fee).to eq(transaction_attributes[:is_fee])
      expect(response.first.is_income).to eq(transaction_attributes[:is_income])
      expect(response.first.is_overdraft_fee).to eq(transaction_attributes[:is_overdraft_fee])
      expect(response.first.is_payroll_advance).to eq(transaction_attributes[:is_payroll_advance])
      expect(response.first.latitude).to eq(transaction_attributes[:latitude])
      expect(response.first.longitude).to eq(transaction_attributes[:longitude])
      expect(response.first.member_guid).to eq(transaction_attributes[:member_guid])
      expect(response.first.memo).to eq(transaction_attributes[:memo])
      expect(response.first.merchant_category_code).to eq(transaction_attributes[:merchant_category_code])
      expect(response.first.original_description).to eq(transaction_attributes[:original_description])
      expect(response.first.posted_at).to eq(transaction_attributes[:posted_at])
      expect(response.first.status).to eq(transaction_attributes[:status])
      expect(response.first.top_level_category).to eq(transaction_attributes[:top_level_category])
      expect(response.first.transacted_at).to eq(transaction_attributes[:transacted_at])
      expect(response.first.type).to eq(transaction_attributes[:type])
      expect(response.first.updated_at).to eq(transaction_attributes[:updated_at])
      expect(response.first.user_guid).to eq(transaction_attributes[:user_guid])
    end
  end
end
