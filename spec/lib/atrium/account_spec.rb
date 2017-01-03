require "spec_helper"

describe ::Atrium::Account do

  let(:account_response) { ::JSON.parse(raw_account_response)}
  let(:accounts_response) { ::JSON.parse(raw_accounts_response)}
  let(:account_attributes) do
    {
      :apr => 3.4,
      :apy => 3.5,
      :available_balance => 20000,
      :available_credit => 15000,
      :balance => 25_000,
      :created_at => "2016-10-06T09:43:42+00:00",
      :credit_limit => 5000,
      :day_payment_is_due => "2016-10-06T09:43:42+00:00",
      :guid => "ACT-06d7f44b",
      :institution_code => "chase",
      :interest_rate => 5.04,
      :is_closed => false,
      :last_payment => "2016-10-06T09:43:42+00:00",
      :last_payment_at => "2016-10-06T09:43:42+00:00",
      :matures_on => "2016-10-06T09:43:42+00:00",
      :member_guid => "MBR",
      :minimum_balance => 2000,
      :minimum_payment => 30.00,
      :name => "CHASE CHECKING",
      :original_balance => 40000,
      :payment_due_at => "2016-10-06T09:43:42+00:00",
      :payoff_balance => 4000,
      :started_on => "2016-10-06T09:43:42+00:00",
      :subtype => 2,
      :total_account_value => 10000,
      :type => 1,
      :updated_at => "2016-10-06T09:43:42+00:00",
      :user_guid => user_guid,
    }
  end

  let(:raw_account_response) {
    { :account => account_attributes }.to_json
  }
  let(:raw_accounts_response) {
    { :accounts => [account_attributes, account_attributes]}.to_json
  }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(accounts_response) }

    it "should return list of accounts" do
      response = described_class.list(:user_guid => user_guid)

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

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(account_response) }

    it "should return account" do
      response = described_class.read(:user_guid => user_guid, :account_guid => account_attributes[:guid])

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
