require "spec_helper"

describe ::Atrium::Member do
  let(:member_response) { ::JSON.parse(raw_member_response)}
  let(:members_response) { ::JSON.parse(raw_members_response)}
  let(:member_attributes) do
    {
      :aggregated_at => "2016-10-06T09:43:42+00:00",
      :guid => "MBR",
      :identifier => "PIZZA",
      :institution_code => "chase",
      :metadata => "data",
      :name => "chase-member",
      :status => "INITIATED",
      :successfully_aggregated_at => "2016-10-06T09:43:42+00:00",
      :user_guid => user_guid
    }
  end

  let(:raw_member_response) {
    { :member => member_attributes }.to_json
  }
  let(:raw_members_response) {
    { :members => [member_attributes, member_attributes]}.to_json
  }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }

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

  describe ".show" do
  end
end
