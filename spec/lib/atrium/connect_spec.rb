require "spec_helper"

RSpec.describe ::Atrium::Connect do
  include_context "configure"

  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }
  let(:raw_account_response) { { :user => connect_attributes }.to_json }
  let(:connect_response) { ::JSON.parse(raw_account_response) }
  let(:connect_attributes) do
    {
      :guid => "USR-fa7537f3-48aa-a683-a02a-b18940482f54",
      :connect_widget_url => "https://int-widgets.moneydesktop.com/md/connect/jb1rA14m85tw2lyvpgfx4gc6d3Z8z8Ayb8"
    }
  end

  describe ".create" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(connect_response) }

    it "should return valid user object with attributes" do
      response = described_class.create(:user_guid => user_guid)

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::Connect)

      expect(response.guid).to               eq(connect_attributes[:guid])
      expect(response.connect_widget_url).to eq(connect_attributes[:connect_widget_url])
    end

    it "permits a current_institution_code option" do
      expect { described_class.create(:user_guid => user_guid, :options => { :current_institution_code => "some_code" }) }.to_not raise_error
    end

    it "permits a current_member_guid option" do
      expect { described_class.create(:user_guid => user_guid, :options => { :current_member_guid => "MBR-123" }) }.to_not raise_error
    end

    it "permits an is_mobile_webview option" do
      expect { described_class.create(:user_guid => user_guid, :options => { :is_mobile_webview => true }) }.to_not raise_error
    end

    it "permits an update_credentials option" do
      expect { described_class.create(:user_guid => user_guid, :options => { :update_credentials => true }) }.to_not raise_error
    end

    it "rejects any unknown option key" do
      expect { described_class.create(:user_guid => user_guid, :options => { :yolo_key => "WHAT UP?" }) }.to raise_error(::ArgumentError)
    end
  end
end
