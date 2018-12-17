=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require "spec_helper"
require "json"

# Unit tests for Atrium::MembersApi
# Please update as you see appropriate
describe "MembersApi" do
  before do
    # run before each test
    @instance = Atrium::MembersApi.new
  end

  after do
    # run after each test
  end

  describe "test an instance of MembersApi" do
    it "should create an instance of MembersApi" do
      expect(@instance).to be_instance_of(Atrium::MembersApi)
    end
  end

  # unit tests for aggregate_member
  # Aggregate member
  # Calling this endpoint initiates an aggregation event for the member. This brings in the latest account and transaction data from the connected institution. If this data has recently been updated, MX may not initiate an aggregation event. 
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [MemberResponseBody]
  describe "aggregate_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_member
  # Create member
  # This endpoint allows you to create a new member. Members are created with the required parameters credentials and institution_code, and the optional parameters identifier and metadata.&lt;br&gt; When creating a member, you&#39;ll need to include the correct type of credential required by the financial institution and provided by the user. You can find out which credential type is required with the /institutions/{institution_code}/credentials endpoint.&lt;br&gt; If successful, Atrium will respond with the newly-created member object.&lt;br&gt; Once you successfully create a member, MX will immediately validate the provided credentials and attempt to aggregate data for accounts and transactions. 
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param body Member object to be created with optional parameters (identifier and metadata) and required parameters (credentials and institution_code)
  # @param [Hash] opts the optional parameters
  # @return [MemberResponseBody]
  describe "create_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_member
  # Delete member
  # Accessing this endpoint will permanently delete a member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe "delete_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_member_accounts
  # List member accounts
  # This endpoint returns an array with information about every account associated with a particular member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page Specify current page.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @return [AccountsResponseBody]
  describe "list_member_accounts test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_member_credentials
  # List member credentials
  # This endpoint returns an array which contains information on every non-MFA credential associated with a specific member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [CredentialsResponseBody]
  describe "list_member_credentials test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_member_mfa_challenges
  # List member MFA challenges
  # Use this endpoint for information on what multi-factor authentication challenges need to be answered in order to aggregate a member.&lt;br&gt; If the aggregation is not challenged, i.e., the member does not have a connection status of CHALLENGED, then code 204 No Content will be returned.&lt;br&gt; If the aggregation has been challenged, i.e., the member does have a connection status of CHALLENGED, then code 200 OK will be returned — along with the corresponding credentials. 
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [ChallengesResponseBody]
  describe "list_member_mfa_challenges test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_member_transactions
  # List member transactions
  # Use this endpoint to get all transactions from all accounts associated with a specific member.&lt;br&gt; This endpoint accepts optional URL query parameters — from_date and to_date — which are used to filter transactions according to the date they were posted. If no values are given for the query parameters, from_date will default to 90 days prior to the request and to_date will default to 5 days from the time of the request. 
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :from_date Filter transactions from this date.
  # @option opts [String] :to_date Filter transactions to this date.
  # @option opts [Integer] :page Specify current page.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @return [TransactionsResponseBody]
  describe "list_member_transactions test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_members
  # List members
  # This endpoint returns an array which contains information on every member associated with a specific user.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page Specify current page.
  # @option opts [Integer] :records_per_page Specify records per page.
  # @return [MembersResponseBody]
  describe "list_members test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_member
  # Read member
  # Use this endpoint to read the attributes of a specific member.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [MemberResponseBody]
  describe "read_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for read_member_status
  # Read member connection status
  # This endpoint provides the status of the member&#39;s most recent aggregation event. This is an important step in the aggregation process, and the results returned by this endpoint should determine what you do next in order to successfully aggregate a member.&lt;br&gt; MX has introduced new, more detailed information on the current status of a member&#39;s connection to a financial institution and the state of its aggregation: the connection_status field. These are intended to replace and expand upon the information provided in the status field, which will soon be deprecated; support for the status field remains for the time being. 
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @return [MemberConnectionStatusResponseBody]
  describe "read_member_status test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for resume_member
  # Resume aggregation from MFA
  # This endpoint answers the challenges needed when a member has been challenged by multi-factor authentication.
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param body Member object with MFA challenge answers
  # @param [Hash] opts the optional parameters
  # @return [MemberResponseBody]
  describe "resume_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_member
  # Update member
  # Use this endpoint to update a member&#39;s attributes. Only the credentials, identifier, and metadata parameters can be updated. To get a list of the required credentials for the member, use the list member credentials endpoint. 
  # @param member_guid The unique identifier for a &#x60;member&#x60;.
  # @param user_guid The unique identifier for a &#x60;user&#x60;.
  # @param [Hash] opts the optional parameters
  # @option opts [MemberUpdateRequestBody] :body Member object to be updated with optional parameters (credentials, identifier, metadata)
  # @return [MemberResponseBody]
  describe "update_member test" do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
