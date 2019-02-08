=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class MembersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Aggregate member
    # Calling this endpoint initiates an aggregation event for the member. This brings in the latest account and transaction data from the connected institution. If this data has recently been updated, MX may not initiate an aggregation event. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def aggregate_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = aggregate_member_with_http_info(member_guid, user_guid, opts)
      data
    end

    # Create member
    # This endpoint allows you to create a new member. Members are created with the required parameters credentials and institution_code, and the optional parameters identifier and metadata.<br> When creating a member, you'll need to include the correct type of credential required by the financial institution and provided by the user. You can find out which credential type is required with the /institutions/{institution_code}/credentials endpoint.<br> If successful, Atrium will respond with the newly-created member object.<br> Once you successfully create a member, MX will immediately validate the provided credentials and attempt to aggregate data for accounts and transactions. 
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Member object to be created with optional parameters (identifier and metadata) and required parameters (credentials and institution_code)
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def create_member(user_guid, body, opts = {})
      data, _status_code, _headers = create_member_with_http_info(user_guid, body, opts)
      data
    end

    # Delete member
    # Accessing this endpoint will permanently delete a member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_member(member_guid, user_guid, opts = {})
      delete_member_with_http_info(member_guid, user_guid, opts)
      nil
    end

    # Extend history
    # The extend_history endpoint begins the process of fetching up to 24 months of data associated with a particular `member`.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def extend_history(member_guid, user_guid, opts = {})
      data, _status_code, _headers = extend_history_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List member accounts
    # This endpoint returns an array with information about every account associated with a particular member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [AccountsResponseBody]
    def list_member_accounts(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_member_accounts_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List member credentials
    # This endpoint returns an array which contains information on every non-MFA credential associated with a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [CredentialsResponseBody]
    def list_member_credentials(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_member_credentials_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List member MFA challenges
    # Use this endpoint for information on what multi-factor authentication challenges need to be answered in order to aggregate a member.<br> If the aggregation is not challenged, i.e., the member does not have a connection status of CHALLENGED, then code 204 No Content will be returned.<br> If the aggregation has been challenged, i.e., the member does have a connection status of CHALLENGED, then code 200 OK will be returned — along with the corresponding credentials. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [ChallengesResponseBody]
    def list_member_mfa_challenges(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_member_mfa_challenges_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List member transactions
    # Use this endpoint to get all transactions from all accounts associated with a specific member.<br> This endpoint accepts optional URL query parameters — from_date and to_date — which are used to filter transactions according to the date they were posted. If no values are given for the query parameters, from_date will default to 90 days prior to the request and to_date will default to 5 days from the time of the request. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from_date Filter transactions from this date.
    # @option opts [String] :to_date Filter transactions to this date.
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [TransactionsResponseBody]
    def list_member_transactions(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_member_transactions_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List members
    # This endpoint returns an array which contains information on every member associated with a specific user.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [MembersResponseBody]
    def list_members(user_guid, opts = {})
      data, _status_code, _headers = list_members_with_http_info(user_guid, opts)
      data
    end

    # Read member
    # Use this endpoint to read the attributes of a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def read_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = read_member_with_http_info(member_guid, user_guid, opts)
      data
    end

    # Read member connection status
    # This endpoint provides the status of the member's most recent aggregation event. This is an important step in the aggregation process, and the results returned by this endpoint should determine what you do next in order to successfully aggregate a member.<br> MX has introduced new, more detailed information on the current status of a member's connection to a financial institution and the state of its aggregation: the connection_status field. These are intended to replace and expand upon the information provided in the status field, which will soon be deprecated; support for the status field remains for the time being. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberConnectionStatusResponseBody]
    def read_member_status(member_guid, user_guid, opts = {})
      data, _status_code, _headers = read_member_status_with_http_info(member_guid, user_guid, opts)
      data
    end

    # Resume aggregation from MFA
    # This endpoint answers the challenges needed when a member has been challenged by multi-factor authentication.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Member object with MFA challenge answers
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def resume_member(member_guid, user_guid, body, opts = {})
      data, _status_code, _headers = resume_member_with_http_info(member_guid, user_guid, body, opts)
      data
    end

    # Update member
    # Use this endpoint to update a member's attributes. Only the credentials, identifier, and metadata parameters can be updated. To get a list of the required credentials for the member, use the list member credentials endpoint. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [MemberUpdateRequestBody] :body Member object to be updated with optional parameters (credentials, identifier, metadata)
    # @return [MemberResponseBody]
    def update_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = update_member_with_http_info(member_guid, user_guid, opts)
      data
    end


  private

    # Aggregate member
    # Calling this endpoint initiates an aggregation event for the member. This brings in the latest account and transaction data from the connected institution. If this data has recently been updated, MX may not initiate an aggregation event. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def aggregate_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.aggregate_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.aggregate_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.aggregate_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/aggregate'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#aggregate_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create member
    # This endpoint allows you to create a new member. Members are created with the required parameters credentials and institution_code, and the optional parameters identifier and metadata.&lt;br&gt; When creating a member, you&#39;ll need to include the correct type of credential required by the financial institution and provided by the user. You can find out which credential type is required with the /institutions/{institution_code}/credentials endpoint.&lt;br&gt; If successful, Atrium will respond with the newly-created member object.&lt;br&gt; Once you successfully create a member, MX will immediately validate the provided credentials and attempt to aggregate data for accounts and transactions. 
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Member object to be created with optional parameters (identifier and metadata) and required parameters (credentials and institution_code)
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def create_member_with_http_info(user_guid, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.create_member ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.create_member"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MembersApi.create_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members'.sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#create_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Delete member
    # Accessing this endpoint will permanently delete a member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.delete_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.delete_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.delete_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#delete_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Extend history
    # The extend_history endpoint begins the process of fetching up to 24 months of data associated with a particular &#x60;member&#x60;.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def extend_history_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.extend_history ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.extend_history"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.extend_history"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/extend_history'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#extend_history\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List member accounts
    # This endpoint returns an array with information about every account associated with a particular member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [Array<(AccountsResponseBody, Fixnum, Hash)>] AccountsResponseBody data, response status code and response headers
    def list_member_accounts_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.list_member_accounts ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.list_member_accounts"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.list_member_accounts"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/accounts'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'records_per_page'] = opts[:'records_per_page'] if !opts[:'records_per_page'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'AccountsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#list_member_accounts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List member credentials
    # This endpoint returns an array which contains information on every non-MFA credential associated with a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CredentialsResponseBody, Fixnum, Hash)>] CredentialsResponseBody data, response status code and response headers
    def list_member_credentials_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.list_member_credentials ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.list_member_credentials"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.list_member_credentials"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/credentials'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'CredentialsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#list_member_credentials\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List member MFA challenges
    # Use this endpoint for information on what multi-factor authentication challenges need to be answered in order to aggregate a member.&lt;br&gt; If the aggregation is not challenged, i.e., the member does not have a connection status of CHALLENGED, then code 204 No Content will be returned.&lt;br&gt; If the aggregation has been challenged, i.e., the member does have a connection status of CHALLENGED, then code 200 OK will be returned — along with the corresponding credentials. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ChallengesResponseBody, Fixnum, Hash)>] ChallengesResponseBody data, response status code and response headers
    def list_member_mfa_challenges_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.list_member_mfa_challenges ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.list_member_mfa_challenges"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.list_member_mfa_challenges"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/challenges'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ChallengesResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#list_member_mfa_challenges\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List member transactions
    # Use this endpoint to get all transactions from all accounts associated with a specific member.&lt;br&gt; This endpoint accepts optional URL query parameters — from_date and to_date — which are used to filter transactions according to the date they were posted. If no values are given for the query parameters, from_date will default to 90 days prior to the request and to_date will default to 5 days from the time of the request. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from_date Filter transactions from this date.
    # @option opts [String] :to_date Filter transactions to this date.
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [Array<(TransactionsResponseBody, Fixnum, Hash)>] TransactionsResponseBody data, response status code and response headers
    def list_member_transactions_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.list_member_transactions ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.list_member_transactions"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.list_member_transactions"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/transactions'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}
      query_params[:'from_date'] = opts[:'from_date'] if !opts[:'from_date'].nil?
      query_params[:'to_date'] = opts[:'to_date'] if !opts[:'to_date'].nil?
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'records_per_page'] = opts[:'records_per_page'] if !opts[:'records_per_page'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#list_member_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List members
    # This endpoint returns an array which contains information on every member associated with a specific user.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [Array<(MembersResponseBody, Fixnum, Hash)>] MembersResponseBody data, response status code and response headers
    def list_members_with_http_info(user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.list_members ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.list_members"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members'.sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'records_per_page'] = opts[:'records_per_page'] if !opts[:'records_per_page'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MembersResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#list_members\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read member
    # Use this endpoint to read the attributes of a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def read_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.read_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.read_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.read_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#read_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read member connection status
    # This endpoint provides the status of the member&#39;s most recent aggregation event. This is an important step in the aggregation process, and the results returned by this endpoint should determine what you do next in order to successfully aggregate a member.&lt;br&gt; MX has introduced new, more detailed information on the current status of a member&#39;s connection to a financial institution and the state of its aggregation: the connection_status field. These are intended to replace and expand upon the information provided in the status field, which will soon be deprecated; support for the status field remains for the time being. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberConnectionStatusResponseBody, Fixnum, Hash)>] MemberConnectionStatusResponseBody data, response status code and response headers
    def read_member_status_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.read_member_status ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.read_member_status"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.read_member_status"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/status'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberConnectionStatusResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#read_member_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Resume aggregation from MFA
    # This endpoint answers the challenges needed when a member has been challenged by multi-factor authentication.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Member object with MFA challenge answers
    # @param [Hash] opts the optional parameters
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def resume_member_with_http_info(member_guid, user_guid, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.resume_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.resume_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.resume_member"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MembersApi.resume_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/resume'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#resume_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update member
    # Use this endpoint to update a member&#39;s attributes. Only the credentials, identifier, and metadata parameters can be updated. To get a list of the required credentials for the member, use the list member credentials endpoint. 
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [MemberUpdateRequestBody] :body Member object to be updated with optional parameters (credentials, identifier, metadata)
    # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def update_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MembersApi.update_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling MembersApi.update_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling MembersApi.update_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.mx.atrium.v1+json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['apiKey', 'clientID']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MemberResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MembersApi#update_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
