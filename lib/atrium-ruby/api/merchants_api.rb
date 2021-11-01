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
    # List merchant locations
    # Returns a list of all the merchant locations associated with a merchant, including physical location, latitude, longitude, etc.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [MerchantLocationsResponseBody]
    def list_merchant_locations(merchant_guid, opts = {})
      data, _status_code, _headers = list_merchant_locations_with_http_info(merchant_guid, opts)
      data
    end

    # List merchants
    # Returns a list of merchnants.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [MerchantsResponseBody]
    def list_merchants(opts = {})
      data, _status_code, _headers = list_merchants_with_http_info(opts)
      data
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

    # Read merchant location
    # Retuns a specific location associated with a merchant, including physical location, latitude, longitude, etc.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param merchant_location_guid The unique identifier for a &#x60;merchant_location&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [MerchantLocationResponseBody]
    def read_merchant_location(merchant_guid, merchant_location_guid, opts = {})
      data, _status_code, _headers = read_merchant_location_with_http_info(merchant_guid, merchant_location_guid, opts)
      data
    end


  private

    # List merchant locations
    # Returns a list of all the merchant locations associated with a merchant, including physical location, latitude, longitude, etc.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [Array<(MerchantLocationsResponseBody, Fixnum, Hash)>] MerchantLocationsResponseBody data, response status code and response headers
    def list_merchant_locations_with_http_info(merchant_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MerchantsApi.list_merchant_locations ...'
      end
      # verify the required parameter 'merchant_guid' is set
      if @api_client.config.client_side_validation && merchant_guid.nil?
        fail ArgumentError, "Missing the required parameter 'merchant_guid' when calling MerchantsApi.list_merchant_locations"
      end
      # resource path
      local_var_path = '/merchants/{merchant_guid}/merchant_locations'.sub('{' + 'merchant_guid' + '}', merchant_guid.to_s)

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
        :return_type => 'MerchantLocationsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MerchantsApi#list_merchant_locations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List merchants
    # Returns a list of merchnants.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [Array<(MerchantsResponseBody, Fixnum, Hash)>] MerchantsResponseBody data, response status code and response headers
    def list_merchants_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MerchantsApi.list_merchants ...'
      end
      # resource path
      local_var_path = '/merchants'

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
        :return_type => 'MerchantsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MerchantsApi#list_merchants\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
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
    # Read merchant location
    # Retuns a specific location associated with a merchant, including physical location, latitude, longitude, etc.
    # @param merchant_guid The unique identifier for a &#x60;merchant&#x60;.
    # @param merchant_location_guid The unique identifier for a &#x60;merchant_location&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MerchantLocationResponseBody, Fixnum, Hash)>] MerchantLocationResponseBody data, response status code and response headers
    def read_merchant_location_with_http_info(merchant_guid, merchant_location_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MerchantsApi.read_merchant_location ...'
      end
      # verify the required parameter 'merchant_guid' is set
      if @api_client.config.client_side_validation && merchant_guid.nil?
        fail ArgumentError, "Missing the required parameter 'merchant_guid' when calling MerchantsApi.read_merchant_location"
      end
      # verify the required parameter 'merchant_location_guid' is set
      if @api_client.config.client_side_validation && merchant_location_guid.nil?
        fail ArgumentError, "Missing the required parameter 'merchant_location_guid' when calling MerchantsApi.read_merchant_location"
      end
      # resource path
      local_var_path = '/merchants/{merchant_guid}/merchant_locations/{merchant_location_guid}'.sub('{' + 'merchant_guid' + '}', merchant_guid.to_s).sub('{' + 'merchant_location_guid' + '}', merchant_location_guid.to_s)

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
        :return_type => 'MerchantLocationResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MerchantsApi#read_merchant_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
