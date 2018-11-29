=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for MX::IdentityApi
# Please update as you see appropriate
describe 'IdentityApi' do
  before do
    # run before each test
    @instance = MX::IdentityApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of IdentityApi' do
    it 'should create an instance of IdentityApi' do
      expect(@instance).to be_instance_of(MX::IdentityApi)
    end
  end

  # unit tests for identify_member
  # Identify
  # The identify endpoint begins an identification process for an already-existing member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [Member]
  describe 'identify_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_account_owners
  # List member account owners
  # This endpoint returns an array with information about every account associated with a particular member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [AccountOwners]
  describe 'list_account_owners test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
