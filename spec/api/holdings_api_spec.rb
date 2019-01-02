=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for Atrium::HoldingsApi
# Please update as you see appropriate
describe 'HoldingsApi' do
  before do
    # run before each test
    @instance = Atrium::HoldingsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of HoldingsApi' do
    it 'should create an instance of HoldingsApi' do
      expect(@instance).to be_instance_of(Atrium::HoldingsApi)
    end
  end

  # unit tests for list_holdings
  # List holdings
  # Use this endpoint to read all holdings associated with a specific user.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [HoldingsResponseBody]
  describe 'list_holdings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_holdings_by_account
  # List holdings by account
  # Use this endpoint to read all holdings associated with a specific account.
  # @param account_guid The unique identifier for an &#x60;account&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [HoldingsResponseBody]
  describe 'list_holdings_by_account test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_holdings_by_member
  # List holdings by member
  # Use this endpoint to read all holdings associated with a specific member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [HoldingsResponseBody]
  describe 'list_holdings_by_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_holding
  # Read holding
  # Use this endpoint to read the attributes of a specific holding.
  # @param holding_guid The unique identifier for a &#x60;holding&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [HoldingResponseBody]
  describe 'read_holding test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
