=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for MX::ConnectWidgetApi
# Please update as you see appropriate
describe 'ConnectWidgetApi' do
  before do
    # run before each test
    @instance = MX::ConnectWidgetApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ConnectWidgetApi' do
    it 'should create an instance of ConnectWidgetApi' do
      expect(@instance).to be_instance_of(MX::ConnectWidgetApi)
    end
  end

  # unit tests for get_connect_widget
  # Embedding in a website
  # This endpoint will return a URL for an embeddable version of MX Connect.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param body Optional config options for WebView (is_mobile_webview, current_institution_code, current_member_guid, update_credentials)
  # @param [Hash] opts the optional parameters
  # @return [ConnectWidgetResponseBody]
  describe 'get_connect_widget test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
