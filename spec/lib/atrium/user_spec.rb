require "spec_helper"

describe ::Atrium::User do
  let(:identifier) { "DAB_ALL_DAY" }
  let(:is_disabled) { false }
  let(:metadata) { "{\"first_name\": \"Steven\", \"favorite_color\": \"BLUE\"}" }
  let(:raw_user_response) { { :user => user_attributes }.to_json }
  let(:raw_users_response) {
    { :users => [user_attributes, user_attributes]}.to_json
  }
  let(:user_response) { ::JSON.parse(raw_user_response)}
  let(:users_response) { ::JSON.parse(raw_users_response)}
  let(:user_attributes) do
    {
      :guid => user_guid,
      :identifier => identifier,
      :is_disabled => is_disabled,
      :metadata => metadata
    }
  end
  let(:user) { ::Atrium::User.new(user_attributes) }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".create" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(user_response) }

    it "should return valid user object with attributes" do
      response = described_class.create(:identifier => identifier, :metadata => metadata, :is_disabled => is_disabled )

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::User)

      expect(response.guid).to eq(user_attributes[:guid])
      expect(response.identifier).to eq(user_attributes[:identifier])
      expect(response.is_disabled).to eq(user_attributes[:is_disabled])
      expect(response.metadata).to eq(user_attributes[:metadata])
    end
  end

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(users_response) }

    it "should return list of users" do
      response = described_class.list

      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::User)

      expect(response.first.guid).to eq(user_attributes[:guid])
      expect(response.first.identifier).to eq(user_attributes[:identifier])
      expect(response.first.is_disabled).to eq(user_attributes[:is_disabled])
      expect(response.first.metadata).to eq(user_attributes[:metadata])
    end
  end

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(user_response) }

    it "should return a users" do
      response = described_class.read(:guid => user_guid)

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::User)

      expect(response.guid).to eq(user_attributes[:guid])
      expect(response.identifier).to eq(user_attributes[:identifier])
      expect(response.is_disabled).to eq(user_attributes[:is_disabled])
      expect(response.metadata).to eq(user_attributes[:metadata])
    end
  end

  describe "account" do
    let(:account_response) { ::JSON.parse(raw_account_response)}
    let(:accounts_response) { ::JSON.parse(raw_accounts_response)}
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
    let(:raw_accounts_response) {
      { :accounts => [account_attributes, account_attributes]}.to_json
    }

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
end
