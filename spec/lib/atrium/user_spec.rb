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
end
