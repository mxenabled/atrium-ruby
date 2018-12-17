=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class VerificationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Read account numbers
    # Use this endpoint to check whether account and routing numbers are available for accounts associated with a particular member. It returns the account_numbers object, which contains account and routing number data for each account associated with the member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [AccountNumbersResponseBody]
    def list_account_numbers(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_account_numbers_with_http_info(member_guid, user_guid, opts)
      data
    end

    # Read account numbers by account GUID
    # Use this endpoint to check whether account and routing numbers are available for a specific account. It returns the account_numbers object, which contains account and routing number data.
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [AccountNumbersResponseBody]
    def list_account_numbers_by_account(account_guid, user_guid, opts = {})
      data, _status_code, _headers = list_account_numbers_by_account_with_http_info(account_guid, user_guid, opts)
      data
    end

    # Verify
    # The verify endpoint begins a verification process for a member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def verify_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = verify_member_with_http_info(member_guid, user_guid, opts)
      data
    end


  private

    # Read account numbers
    # Use this endpoint to check whether account and routing numbers are available for accounts associated with a particular member. It returns the account_numbers object, which contains account and routing number data for each account associated with the member.
        # @param member_guid The unique identifier for a &#x60;member&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(AccountNumbersResponseBody, Fixnum, Hash)>] AccountNumbersResponseBody data, response status code and response headers
    def list_account_numbers_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VerificationApi.list_account_numbers ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling VerificationApi.list_account_numbers"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling VerificationApi.list_account_numbers"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/account_numbers'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'AccountNumbersResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VerificationApi#list_account_numbers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read account numbers by account GUID
    # Use this endpoint to check whether account and routing numbers are available for a specific account. It returns the account_numbers object, which contains account and routing number data.
        # @param account_guid The unique identifier for an &#x60;account&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(AccountNumbersResponseBody, Fixnum, Hash)>] AccountNumbersResponseBody data, response status code and response headers
    def list_account_numbers_by_account_with_http_info(account_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VerificationApi.list_account_numbers_by_account ...'
      end
      # verify the required parameter 'account_guid' is set
      if @api_client.config.client_side_validation && account_guid.nil?
        fail ArgumentError, "Missing the required parameter 'account_guid' when calling VerificationApi.list_account_numbers_by_account"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling VerificationApi.list_account_numbers_by_account"
      end
      # resource path
      local_var_path = '/users/{user_guid}/accounts/{account_guid}/account_numbers'.sub('{' + 'account_guid' + '}', account_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'AccountNumbersResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VerificationApi#list_account_numbers_by_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Verify
    # The verify endpoint begins a verification process for a member.
        # @param member_guid The unique identifier for a &#x60;member&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def verify_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VerificationApi.verify_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling VerificationApi.verify_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling VerificationApi.verify_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/verify'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        @api_client.config.logger.debug "API called: VerificationApi#verify_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
