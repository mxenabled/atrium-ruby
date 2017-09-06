require "spec_helper"

RSpec.describe ::Atrium::User do
  include_context "configure"

  let(:user_guid)   { "USR-a0d28b12-2ccf-e80f-df0f-157f17d1b134" }
  let(:identifier)  { "32d355b8-e2b4-449a-ab5c-86946224e0f9" }
  let(:is_disabled) { false }
  let(:metadata)    { '{"first_name": "Steven", "favorite_color": "BLUE"}' }

  let(:raw_users_response) { { :users => [user_attributes, user_attributes] }.to_json }
  let(:users_response) { ::JSON.parse(raw_users_response) }
  let(:user_attributes) do
    {
      :guid => user_guid,
      :identifier => identifier,
      :is_disabled => is_disabled,
      :metadata => metadata
    }
  end
  let(:user) { ::Atrium::User.new(user_attributes) }

  describe ".create" do
    include_context "vcr"
    let(:vcr_cassette_name) { "atrium/user/create" }

    let(:identifier)  { "32d355b8-e2b4-449a-ab5c-86946224e0f9" }

    it "should return valid user object with attributes" do
      response = described_class.create(:identifier => identifier, :metadata => metadata, :is_disabled => is_disabled)

      expect(response).to be_a ::Object
      expect(response).to be_an ::Atrium::User

      expect(response.guid).to        be_a String
      expect(response.identifier).to  eq identifier
      expect(response.metadata).to    eq metadata
      expect(response.is_disabled).to eq is_disabled
    end
  end

  describe ".list" do
    include_context "vcr"
    let(:vcr_cassette_name) { "atrium/user/list" }

    it "should return list of users" do
      response = described_class.list

      expect(response).to        be_an ::Array
      expect(response.length).to eq 1

      expect(response.first).to             be_an ::Atrium::User
      expect(response.first.guid).to        eq user_guid
      expect(response.first.identifier).to  eq identifier
      expect(response.first.metadata).to    eq metadata
      expect(response.first.is_disabled).to eq is_disabled
    end
  end

  describe ".read" do
    include_context "vcr"
    let(:vcr_cassette_name) { "atrium/user/read" }

    it "should return a user" do
      response = described_class.read(:guid => user_guid)

      expect(response).to be_a ::Object
      expect(response).to be_an ::Atrium::User

      expect(response.guid).to        eq user_guid
      expect(response.identifier).to  eq identifier
      expect(response.metadata).to    eq metadata
      expect(response.is_disabled).to eq is_disabled
    end
  end

  describe "account" do
    let(:account_response) { ::JSON.parse(raw_account_response) }
    let(:accounts_response) { ::JSON.parse(raw_accounts_response) }
    let(:account_attributes) do
      {
        :apr => 3.4,
        :apy => 3.5,
        :available_balance => 20_000,
        :available_credit => 15_000,
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
        :original_balance => 40_000,
        :payment_due_at => "2016-10-06T09:43:4200:00",
        :payoff_balance => 4000,
        :started_on => "2016-10-06T09:43:4200:00",
        :subtype => 2,
        :total_account_value => 10_000,
        :type => 1,
        :updated_at => "2016-10-06T09:43:4200:00",
        :user_guid => user_guid
      }
    end
    let(:raw_accounts_response) do
      { :accounts => [account_attributes, account_attributes] }.to_json
    end

    before { allow(::Atrium.client).to receive(:make_request).and_return(accounts_response) }

    it "should return accounts for user" do
      response = user.accounts

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

  describe "delete" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(users_response) }

    it "should return user" do
      response = user.delete

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::User)

      expect(response.guid).to eq(user_attributes[:guid])
      expect(response.identifier).to eq(user_attributes[:identifier])
      expect(response.is_disabled).to eq(user_attributes[:is_disabled])
      expect(response.metadata).to eq(user_attributes[:metadata])
    end
  end

  describe "user transactions" do
    let(:transaction_response) { ::JSON.parse(raw_transaction_response) }
    let(:transactions_response) { ::JSON.parse(raw_transactions_response) }
    let(:transaction_attributes) do
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
    end
    let(:raw_transaction_response) do
      { :transaction => transaction_attributes }.to_json
    end
    let(:raw_transactions_response) do
      { :transactions => [transaction_attributes, transaction_attributes] }.to_json
    end
    context "transactions" do
      before { allow(::Atrium.client).to receive(:make_request).and_return(transactions_response) }

      it "should return a users transactions" do
        response = user.transactions

        expect(response).to be_kind_of(::Array)
        expect(response.length).to eq(2)
        expect(response.first).to be_kind_of(::Atrium::Transaction)

        expect(response.first.account_guid).to eq(transaction_attributes[:account_guid])
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

  describe "#update" do
    let(:raw_user_response) do
      { :user => user_attributes.merge(update_params) }.to_json
    end
    let(:update_params) do
      {
        :guid => user_guid,
        :identifier => "PIZZZAAA",
        :is_disabled => is_disabled,
        :metadata => metadata
      }
    end
    let(:updated_user_response) { ::JSON.parse(raw_user_response) }

    before { allow(::Atrium.client).to receive(:make_request).and_return(updated_user_response) }

    it "should return updated user" do
      response = user.update(update_params)

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::User)

      expect(response.guid).to eq(update_params[:guid])
      expect(response.identifier).to eq(update_params[:identifier])
      expect(response.is_disabled).to eq(update_params[:is_disabled])
      expect(response.metadata).to eq(update_params[:metadata])
    end
  end

  describe "._user_pagination_options" do
    it "builds default pagination params for transactions" do
      options = described_class._user_pagination_options({})
      expect(options).to eq(:endpoint => "/users", :resource => "users")
    end
  end
end
