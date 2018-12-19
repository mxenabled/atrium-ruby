=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class MerchantsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Read merchant
    # Returns information about a particular merchant, such as a logo, name, and website.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MerchantResponseBody]
    def read_merchant(merchant_guid, opts = {})
      data, _status_code, _headers = read_merchant_with_http_info(merchant_guid, opts)
      data
    end


  private

    # Read merchant
    # Returns information about a particular merchant, such as a logo, name, and website.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MerchantResponseBody, Fixnum, Hash)>] MerchantResponseBody data, response status code and response headers
    def read_merchant_with_http_info(merchant_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MerchantsApi.read_merchant ...'
      end
      # verify the required parameter 'merchant_guid' is set
      if @api_client.config.client_side_validation && merchant_guid.nil?
        fail ArgumentError, "Missing the required parameter 'merchant_guid' when calling MerchantsApi.read_merchant"
      end
      # resource path
      local_var_path = '/merchants/{merchant_guid}'.sub('{' + 'merchant_guid' + '}', merchant_guid.to_s)

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
        :return_type => 'MerchantResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MerchantsApi#read_merchant\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
