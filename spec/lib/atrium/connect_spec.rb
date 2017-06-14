require 'spec_helper'

RSpec.describe ::Atrium::Connect do
  let(:user_guid) { 'USR-fa7537f3-48aa-a683-a02a-b18940482f54' }
  let(:raw_account_response) { { user: connect_attributes }.to_json }
  let(:connect_response) { ::JSON.parse(raw_account_response) }
  let(:connect_attributes) do
    {
      guid: 'USR-fa7537f3-48aa-a683-a02a-b18940482f54',
      connect_widget_url: 'https://int-widgets.moneydesktop.com/md/connect/jb1rA14m85tw2lyvpgfx4gc6d3Z8z8Ayb8'
    }
  end

  describe '.create' do
    before { allow(::Atrium.client).to receive(:make_request).and_return(connect_response) }

    it 'should return valid user object with attributes' do
      response = described_class.create(user_guid: user_guid)

      expect(response).to be_kind_of(::Object)
      expect(response).to be_kind_of(::Atrium::Connect)

      expect(response.guid).to               eq(connect_attributes[:guid])
      expect(response.connect_widget_url).to eq(connect_attributes[:connect_widget_url])
    end
  end
end
