require "spec_helper"

describe ::Atrium::Institution do
  let(:credentials) {
    [
      { :guid => "CRD-123", :value => "user_name" },
      { :guid => "CRD-456", :value => "password" }
    ]
  }
  let(:institution) { ::Atrium::Member.new(institution_attributes) }
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
    { :institution => institution_attributes }.to_json
  }
  let(:raw_institutions_response) {
    { :institutions => [institution_attributes, institution_attributes]}.to_json
  }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

  describe ".list" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(institutions_response) }

    it "should return an array of institutions" do
      response = ::Atrium::Institution.list

      expect(response).to be_kind_of(::Array)
      expect(response.length).to eq(2)
      expect(response.first).to be_kind_of(::Atrium::Institution)

      expect(response.first.code).to eq(institution_attributes[:code])
      expect(response.first.name).to eq(institution_attributes[:name])
      expect(response.first.url).to eq(institution_attributes[:url])
    end
  end
end
