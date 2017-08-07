require "spec_helper"

RSpec.describe Atrium::Client do
  let(:client) { described_class.new }

  describe "#initialize" do
    context "with default params" do
      it "sets mx_api_key to nil" do
        expect(client.mx_api_key).to eq nil
      end

      it "sets mx_client_id to nil" do
        expect(client.mx_client_id).to eq nil
      end

      it 'sets base_url to "https://vestibule.mx.com"' do
        expect(client.base_url).to eq "https://vestibule.mx.com"
      end
    end

    context "with params" do
      let(:client) { described_class.new("API_KEY", "CLIENT_ID", "BASE_URL") }

      it "sets mx_api_key to API_KEY" do
        expect(client.mx_api_key).to eq "API_KEY"
      end

      it "sets mx_client_id to nil" do
        expect(client.mx_client_id).to eq "CLIENT_ID"
      end

      it "sets base_url to BASE_URL" do
        expect(client.base_url).to eq "BASE_URL"
      end
    end
  end

  # (method, url, ::JSON.dump(body), headers)

  describe "#make_request" do
    let(:client)   { described_class.new("API_KEY", "CLIENT_ID", "BASE_URL") }
    let(:response) { OpenStruct.new(:status => 200, :body => '{ "key": "value" }') }

    it "builds the request url" do
      expect(client.http_client).to receive(:get).with("BASE_URL/ENDPOINT", any_args).and_return(response)
      client.make_request(:get, "/ENDPOINT")
    end

    it "sends authentication headers" do
      expect(client.http_client).to receive(:get).with(anything, anything, hash_including(
                                                                             "MX-API-KEY"   => "API_KEY",
                                                                             "MX-CLIENT-ID" => "CLIENT_ID"
      )).and_return(response)
      client.make_request(:get, "/ENDPOINT")
    end

    it "sends the body as JSON" do
      expect(client.http_client).to receive(:get).with(anything, '{"key":"value"}', any_args).and_return(response)
      client.make_request(:get, "/ENDPOINT", :key => :value)
    end

    it "parses the json response" do
      expect(client.http_client).to receive(:get).with(any_args).and_return(response)
      parsed_response = client.make_request(:get, "/ENDPOINT", :key => :value)
      expect(parsed_response["key"]).to eq "value"
    end

    context "with error" do
      let(:response) { OpenStruct.new(:status => 500, :body => "ERROR_MESSAGE") }

      it "raises an ::Atrium::Error" do
        allow(client.http_client).to receive(:get).with(any_args).and_return(response)
        expect { client.make_request(:get, "/ENDPOINT", :key => :value) }.to raise_error(::Atrium::Error)
      end
    end
  end

  describe "#http_client" do
    it "returns an HTTPClient" do
      expect(client.http_client).to be_a ::HTTPClient
    end
  end
end
