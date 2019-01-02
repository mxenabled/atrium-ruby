=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class HoldingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # List holdings
    # Use this endpoint to read all holdings associated with a specific user.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [HoldingsResponseBody]
    def list_holdings(user_guid, opts = {})
      data, _status_code, _headers = list_holdings_with_http_info(user_guid, opts)
      data
    end

    # List holdings by account
    # Use this endpoint to read all holdings associated with a specific account.
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [HoldingsResponseBody]
    def list_holdings_by_account(account_guid, user_guid, opts = {})
      data, _status_code, _headers = list_holdings_by_account_with_http_info(account_guid, user_guid, opts)
      data
    end

    # List holdings by member
    # Use this endpoint to read all holdings associated with a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [HoldingsResponseBody]
    def list_holdings_by_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_holdings_by_member_with_http_info(member_guid, user_guid, opts)
      data
    end

    # Read holding
    # Use this endpoint to read the attributes of a specific holding.
    # @param holding_guid The unique identifier for a &#x60;holding&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [HoldingResponseBody]
    def read_holding(holding_guid, user_guid, opts = {})
      data, _status_code, _headers = read_holding_with_http_info(holding_guid, user_guid, opts)
      data
    end


  private

    # List holdings
    # Use this endpoint to read all holdings associated with a specific user.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(HoldingsResponseBody, Fixnum, Hash)>] HoldingsResponseBody data, response status code and response headers
    def list_holdings_with_http_info(user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HoldingsApi.list_holdings ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling HoldingsApi.list_holdings"
      end
      # resource path
      local_var_path = '/users/{user_guid}/holdings'.sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'HoldingsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HoldingsApi#list_holdings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List holdings by account
    # Use this endpoint to read all holdings associated with a specific account.
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(HoldingsResponseBody, Fixnum, Hash)>] HoldingsResponseBody data, response status code and response headers
    def list_holdings_by_account_with_http_info(account_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HoldingsApi.list_holdings_by_account ...'
      end
      # verify the required parameter 'account_guid' is set
      if @api_client.config.client_side_validation && account_guid.nil?
        fail ArgumentError, "Missing the required parameter 'account_guid' when calling HoldingsApi.list_holdings_by_account"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling HoldingsApi.list_holdings_by_account"
      end
      # resource path
      local_var_path = '/users/{user_guid}/accounts/{account_guid}/holdings'.sub('{' + 'account_guid' + '}', account_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'HoldingsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HoldingsApi#list_holdings_by_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List holdings by member
    # Use this endpoint to read all holdings associated with a specific member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(HoldingsResponseBody, Fixnum, Hash)>] HoldingsResponseBody data, response status code and response headers
    def list_holdings_by_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HoldingsApi.list_holdings_by_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling HoldingsApi.list_holdings_by_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling HoldingsApi.list_holdings_by_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/holdings'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'HoldingsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HoldingsApi#list_holdings_by_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read holding
    # Use this endpoint to read the attributes of a specific holding.
    # @param holding_guid The unique identifier for a &#x60;holding&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(HoldingResponseBody, Fixnum, Hash)>] HoldingResponseBody data, response status code and response headers
    def read_holding_with_http_info(holding_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: HoldingsApi.read_holding ...'
      end
      # verify the required parameter 'holding_guid' is set
      if @api_client.config.client_side_validation && holding_guid.nil?
        fail ArgumentError, "Missing the required parameter 'holding_guid' when calling HoldingsApi.read_holding"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling HoldingsApi.read_holding"
      end
      # resource path
      local_var_path = '/users/{user_guid}/holdings/{holding_guid}'.sub('{' + 'holding_guid' + '}', holding_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'HoldingResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: HoldingsApi#read_holding\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
