require "spec_helper"

RSpec.describe ::Atrium::Institution do
  let(:pagination) {
    {
      :pagination =>
        {
          :current_page => 1,
          :per_page => 2,
          :total_entries => 4,
          :total_pages => 2
        }
    }
  }
  let(:credentials) {
    [
      { :guid => "CRD-123", :value => "user_name" },
      { :guid => "CRD-456", :value => "password" }
    ]
  }
  let(:institution) { ::Atrium::Member.new(institution_attributes) }
  let(:institution_code) { institution_attributes["code"] }
  let(:institution_response) { ::JSON.parse(raw_institution_response)}
  let(:institutions_response) { ::JSON.parse(raw_institutions_response)}
  let(:institution_attributes) do
    {
      :code => "chase",
      :name => "Chase Bank",
      :url => "https://www.chase.com",
    }
  end
  let(:raw_institution_response) {
    { :institution => institution_attributes }.merge(pagination).to_json
  }
  let(:raw_institutions_response) {
    { :institutions => [institution_attributes, institution_attributes]}.merge(pagination).to_json
  }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(institutions_response) }

    it "should return an array of institutions" do
      response = ::Atrium::Institution.list

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(4)
      expect(response.first).to be_kind_of(::Atrium::Institution)

      expect(response.first.code).to eq(institution_attributes[:code])
      expect(response.first.name).to eq(institution_attributes[:name])
      expect(response.first.url).to eq(institution_attributes[:url])
    end
  end

  describe ".credentials" do
    let(:credential_response) { ::JSON.parse(raw_credential_response)}
    let(:credentials_response) { ::JSON.parse(raw_credentials_response)}
    let(:credential_attributes) do
      {
        :guid => "CRD-123",
        :value => "user-name"
      }
    end
    let(:raw_credential_response) {
      { :credential => credential_attributes }.to_json
    }
    let(:raw_credentials_response) {
      { :credentials => [credential_attributes, credential_attributes]}.to_json
    }

    before { allow(::Atrium.client).to receive(:make_request).and_return(credentials_response) }

    it "should return credentials for institution" do
      response = ::Atrium::Institution.credentials(institution_code)

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::Credential)

      expect(response.first.guid).to eq(credential_attributes[:guid])
      expect(response.first.value).to eq(credential_attributes[:value])
    end
  end
end
