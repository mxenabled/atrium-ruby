=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class ConnectWidgetApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Embedding in a website
    # This endpoint will return a URL for an embeddable version of MX Connect.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Optional config options for WebView (is_mobile_webview, current_institution_code, current_member_guid, update_credentials)
    # @param [Hash] opts the optional parameters
    # @return [ConnectWidgetResponseBody]
    def get_connect_widget(user_guid, body, opts = {})
      data, _status_code, _headers = get_connect_widget_with_http_info(user_guid, body, opts)
      data
    end


  private

    # Embedding in a website
    # This endpoint will return a URL for an embeddable version of MX Connect.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param body Optional config options for WebView (is_mobile_webview, current_institution_code, current_member_guid, update_credentials)
    # @param [Hash] opts the optional parameters
    # @return [Array<(ConnectWidgetResponseBody, Fixnum, Hash)>] ConnectWidgetResponseBody data, response status code and response headers
    def get_connect_widget_with_http_info(user_guid, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectWidgetApi.get_connect_widget ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling ConnectWidgetApi.get_connect_widget"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling ConnectWidgetApi.get_connect_widget"
      end
      # resource path
      local_var_path = '/users/{user_guid}/connect_widget_url'.sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'ConnectWidgetResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectWidgetApi#get_connect_widget\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
