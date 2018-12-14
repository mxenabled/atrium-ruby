=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for MX::ConnectWidget
# Please update as you see appropriate
describe 'ConnectWidget' do
  before do
    # run before each test
    @instance = MX::ConnectWidget.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ConnectWidget' do
    it 'should create an instance of ConnectWidget' do
      expect(@instance).to be_instance_of(MX::ConnectWidget)
    end
  end
  describe 'test attribute "connect_widget_url"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "guid"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
