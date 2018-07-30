require "spec_helper"

RSpec.describe ::Atrium::AccountOwner do
  include_context "configure"

  let(:account_owner) { ::Atrium::AccountOwner.new(account_owner_attributes) }
  let(:account_owner_response) { ::JSON.parse(raw_account_owner_response) }
  let(:account_owners_response) { ::JSON.parse(raw_account_owners_response) }
  let(:account_owner_attributes) do
    {
      :guid => "ACO-123",
      :user_guid => "USR-123",
      :member_guid => "MBR-123",
      :account_guid => "ACT-123",
      :owner_name => "Donnie Darko",
      :address => "123 This Way",
      :city => "Middlesex",
      :state => "VA",
      :postal_code => "00000-0000",
      :country => "US",
      :email => "donnie@darko.co",
      :phone => "555-555-5555"
    }
  end

  let(:raw_account_owner_response) do
    { :account_owner => account_owner_attributes }.to_json
  end
  let(:raw_account_owners_response) do
    { :account_owners => [account_owner_attributes, account_owner_attributes],
      :pagination => raw_pagination_attributes }.to_json
  end
  let(:raw_pagination_attributes) { { :total_pages => 100, :total_entries => 2500 } }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }
  let(:member_guid) { "MBR-xr7534e2-34bx-l576-v21e-e57378945x02" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(account_owners_response) }

    it "should return list of account numbers" do
      response = described_class.list(:user_guid => user_guid, :member_guid => member_guid)

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::AccountOwner)

      expect(response.first.guid).to eq(account_owner_attributes[:guid])
      expect(response.first.user_guid).to eq(account_owner_attributes[:user_guid])
      expect(response.first.member_guid).to eq(account_owner_attributes[:member_guid])
      expect(response.first.account_guid).to eq(account_owner_attributes[:account_guid])
      expect(response.first.owner_name).to eq(account_owner_attributes[:owner_name])
      expect(response.first.address).to eq(account_owner_attributes[:address])
      expect(response.first.city).to eq(account_owner_attributes[:city])
      expect(response.first.state).to eq(account_owner_attributes[:state])
      expect(response.first.postal_code).to eq(account_owner_attributes[:postal_code])
      expect(response.first.country).to eq(account_owner_attributes[:country])
      expect(response.first.email).to eq(account_owner_attributes[:email])
      expect(response.first.phone).to eq(account_owner_attributes[:phone])
    end
  end

  describe "._account_owner_pagination_options" do
    it "errors when no user_guid is provided" do
      expect { described_class._account_owner_pagination_options({}).to raise_error }
    end

    it "builds default pagination params for account owners" do
      options = described_class._account_owner_pagination_options(:user_guid => "USR-123", :member_guid => "MBR-123")
      expect(options).to eq(:endpoint => "/users/USR-123/members/MBR-123/account_owners", :resource => "account_owners", :user_guid => "USR-123", :member_guid => "MBR-123")
    end
  end
end
