=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for MX::TransactionsApi
# Please update as you see appropriate
describe 'TransactionsApi' do
  before do
    # run before each test
    @instance = MX::TransactionsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TransactionsApi' do
    it 'should create an instance of TransactionsApi' do
      expect(@instance).to be_instance_of(MX::TransactionsApi)
    end
  end

  # unit tests for cleanse_and_categorize_transactions
  # Categorize transactions
  # Use this endpoint to categorize, cleanse, and classify transactions. These transactions are not persisted or stored on the MX platform.
  # @param body User object to be created with optional parameters (amount, type) amd required parameters (description, identifier)
  # @param [Hash] opts the optional parameters
  # @return [TransactionsCleanseAndCategorize]
  describe 'cleanse_and_categorize_transactions test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_user_transactions
  # List transactions for a user
  # Use this endpoint to get all transactions that belong to a specific user, across all the user&#39;s members and accounts.&lt;br&gt; This endpoint accepts optional query parameters, from_date and to_date, which filter transactions according to the date they were posted. If no values are given, from_date will default to 90 days prior to the request, and to_date will default to 5 days from the time of the request. 
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page Specify current page.
  # @option opts [String] :from_date Filter transactions from this date.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @option opts [String] :to_date Filter transactions to this date.
  # @return [Transactions]
  describe 'list_user_transactions test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_transaction
  # Read a transaction
  # This endpoint allows you to view information about a specific transaction that belongs to a user.&lt;br&gt;
  # @param transaction_guid The unique identifier for a &#x60;transaction&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [Transaction]
  describe 'read_transaction test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
