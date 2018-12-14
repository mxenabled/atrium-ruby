=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module MX
  class IdentityApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Identify
    # The identify endpoint begins an identification process for an already-existing member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MemberResponseBody]
    def identify_member(member_guid, user_guid, opts = {})
      data, _status_code, _headers = identify_member_with_http_info(member_guid, user_guid, opts)
      data
    end

    # List member account owners
    # This endpoint returns an array with information about every account associated with a particular member.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [AccountOwnersResponseBody]
    def list_account_owners(member_guid, user_guid, opts = {})
      data, _status_code, _headers = list_account_owners_with_http_info(member_guid, user_guid, opts)
      data
    end


  private

    # Identify
    # The identify endpoint begins an identification process for an already-existing member.
        # @param member_guid The unique identifier for a &#x60;member&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(MemberResponseBody, Fixnum, Hash)>] MemberResponseBody data, response status code and response headers
    def identify_member_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IdentityApi.identify_member ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling IdentityApi.identify_member"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling IdentityApi.identify_member"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/identify'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        @api_client.config.logger.debug "API called: IdentityApi#identify_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List member account owners
    # This endpoint returns an array with information about every account associated with a particular member.
        # @param member_guid The unique identifier for a &#x60;member&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(AccountOwnersResponseBody, Fixnum, Hash)>] AccountOwnersResponseBody data, response status code and response headers
    def list_account_owners_with_http_info(member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IdentityApi.list_account_owners ...'
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling IdentityApi.list_account_owners"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling IdentityApi.list_account_owners"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/account_owners'.sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'AccountOwnersResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IdentityApi#list_account_owners\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
