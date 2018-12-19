=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for Atrium::VerificationApi
# Please update as you see appropriate
describe 'VerificationApi' do
  before do
    # run before each test
    @instance = Atrium::VerificationApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of VerificationApi' do
    it 'should create an instance of VerificationApi' do
      expect(@instance).to be_instance_of(Atrium::VerificationApi)
    end
  end

  # unit tests for list_account_numbers
  # Read account numbers
  # Use this endpoint to check whether account and routing numbers are available for accounts associated with a particular member. It returns the account_numbers object, which contains account and routing number data for each account associated with the member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [AccountNumbersResponseBody]
  describe 'list_account_numbers test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_account_numbers_by_account
  # Read account numbers by account GUID
  # Use this endpoint to check whether account and routing numbers are available for a specific account. It returns the account_numbers object, which contains account and routing number data.
  # @param account_guid The unique identifier for an &#x60;account&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [AccountNumbersResponseBody]
  describe 'list_account_numbers_by_account test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for verify_member
  # Verify
  # The verify endpoint begins a verification process for a member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [MemberResponseBody]
  describe 'verify_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
