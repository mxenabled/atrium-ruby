=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'spec_helper'
require 'json'

# Unit tests for Atrium::InstitutionsApi
# Please update as you see appropriate
describe 'InstitutionsApi' do
  before do
    # run before each test
    @instance = Atrium::InstitutionsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of InstitutionsApi' do
    it 'should create an instance of InstitutionsApi' do
      expect(@instance).to be_instance_of(Atrium::InstitutionsApi)
    end
  end

  # unit tests for list_institutions
  # List institutions
  # This endpoint allows you to see what institutions are available for connection. Information returned will include the institution_code assigned to a particular institution, URLs for the financial institution&#39;s logo, and the URL for its website.&lt;br&gt; This endpoint takes an optional query string, name&#x3D;{string}. This will list only institutions in which the appended string appears. 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :name This will list only institutions in which the appended string appears.
  # @option opts [Integer] :page Specify current page.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @option opts [BOOLEAN] :supports_account_identification Filter only institutions which support account identification.
  # @option opts [BOOLEAN] :supports_account_statement Filter only institutions which support account statements.
  # @option opts [BOOLEAN] :supports_account_verification Filter only institutions which support account verification.
  # @option opts [BOOLEAN] :supports_transaction_history Filter only institutions which support extended transaction history.
  # @return [InstitutionsResponseBody]
  describe 'list_institutions test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_institution
  # Read institution
  # This endpoint allows you to see information for a specific institution.
  # @param institution_code The institution_code of the institution.
  # @param [Hash] opts the optional parameters
  # @return [InstitutionResponseBody]
  describe 'read_institution test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_institution_credentials
  # Read institution credentials
  # Use this endpoint to see which credentials will be needed to create a member for a specific institution.
  # @param institution_code The institution_code of the institution.
  # @param [Hash] opts the optional parameters
  # @return [CredentialsResponseBody]
  describe 'read_institution_credentials test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
