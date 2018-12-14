=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for MX::UsersApi
# Please update as you see appropriate
describe 'UsersApi' do
  before do
    # run before each test
    @instance = MX::UsersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of UsersApi' do
    it 'should create an instance of UsersApi' do
      expect(@instance).to be_instance_of(MX::UsersApi)
    end
  end

  # unit tests for create_user
  # Create user
  # Call this endpoint to create a new user. Atrium will respond with the newly-created user object if successful. This endpoint accepts several parameters: identifier, metadata, and is_disabled.&lt;br&gt; Disabling a user means that accounts and transactions associated with it will not be updated in the background by MX. It will also restrict access to that user&#39;s data until they are no longer disabled. Users who are disabled for the entirety of an Atrium billing period will not be factored into that month&#39;s bill. 
  # @param body User object to be created with optional parameters (identifier, is_disabled, metadata)
  # @param [Hash] opts the optional parameters
  # @return [UserResponseBody]
  describe 'create_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_user
  # Delete user
  # Calling this endpoint will permanently delete a user from Atrium. If successful, the API will respond with Status: 204 No Content. 
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_users
  # List users
  # Use this endpoint to list every user you&#39;ve created in Atrium.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page Specify current page.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @return [UsersResponseBody]
  describe 'list_users test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_user
  # Read user
  # Use this endpoint to read the attributes of a specific user.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [UserResponseBody]
  describe 'read_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_user
  # Update user
  # Use this endpoint to update the attributes of a specific user. Atrium will respond with the updated user object.&lt;br&gt; Disabling a user means that accounts and transactions associated with it will not be updated in the background by MX. It will also restrict access to that user&#39;s data until they are no longer disabled. Users who are disabled for the entirety of an Atrium billing period will not be factored into that month&#39;s bill.&lt;br&gt; To disable a user, update it and set the is_disabled parameter to true. Set it to false to re-enable the user. 
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [UserUpdateRequestBody] :body User object to be updated with optional parameters (identifier, is_disabled, metadata)
  # @return [UserResponseBody]
  describe 'update_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
