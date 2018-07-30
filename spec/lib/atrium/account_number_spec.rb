require "spec_helper"

RSpec.describe ::Atrium::AccountNumber do
  include_context "configure"

  let(:account_number) { ::Atrium::AccountNumber.new(account_number_attributes) }
  let(:account_number_response) { ::JSON.parse(raw_account_number_response) }
  let(:account_numbers_response) { ::JSON.parse(raw_account_numbers_response) }
  let(:account_number_attributes) do
    {
      :guid => "ACO-123",
      :account_guid => "ACT-123",
      :member_guid => "MBR-123",
      :user_guid => "USR-123",
      :account_number => "1234-5678A",
      :routing_number => "987654321"
    }
  end

  let(:raw_account_number_response) do
    { :account_number => account_number_attributes }.to_json
  end
  let(:raw_account_numbers_response) do
    { :account_numbers => [account_number_attributes, account_number_attributes],
      :pagination => raw_pagination_attributes }.to_json
  end
  let(:raw_pagination_attributes) { { :total_pages => 100, :total_entries => 2500 } }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }
  let(:member_guid) { "MBR-xr7534e2-34bx-l576-v21e-e57378945x02" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(account_numbers_response) }

    it "should return list of account numbers" do
      response = described_class.list(:user_guid => user_guid, :member_guid => member_guid)

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::AccountNumber)

      expect(response.first.guid).to eq(account_number_attributes[:guid])
      expect(response.first.account_guid).to eq(account_number_attributes[:account_guid])
      expect(response.first.member_guid).to eq(account_number_attributes[:member_guid])
      expect(response.first.user_guid).to eq(account_number_attributes[:user_guid])
      expect(response.first.account_number).to eq(account_number_attributes[:account_number])
      expect(response.first.routing_number).to eq(account_number_attributes[:routing_number])
    end
  end

  describe "._account_number_pagination_options" do
    it "errors when no user_guid is provided" do
      expect { described_class._account_number_pagination_options({}).to raise_error }
    end

    it "builds default pagination params for account numbers" do
      options = described_class._account_number_pagination_options(:user_guid => "USR-123", :member_guid => "MBR-123")
      expect(options).to eq(:endpoint => "/users/USR-123/members/MBR-123/account_numbers", :resource => "account_numbers", :user_guid => "USR-123", :member_guid => "MBR-123")
    end
  end
end
