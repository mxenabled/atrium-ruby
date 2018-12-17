=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module Atrium
  class InstitutionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # List institutions
    # This endpoint allows you to see what institutions are available for connection. Information returned will include the institution_code assigned to a particular institution, URLs for the financial institution's logo, and the URL for its website.<br> This endpoint takes an optional query string, name={string}. This will list only institutions in which the appended string appears. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name This will list only institutions in which the appended string appears.
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [InstitutionsResponseBody]
    def list_institutions(opts = {})
      data, _status_code, _headers = list_institutions_with_http_info(opts)
      data
    end

    # Read institution
    # This endpoint allows you to see information for a specific institution.
    # @param institution_code The institution_code of the institution.
    # @param [Hash] opts the optional parameters
    # @return [InstitutionResponseBody]
    def read_institution(institution_code, opts = {})
      data, _status_code, _headers = read_institution_with_http_info(institution_code, opts)
      data
    end

    # Read institution credentials
    # Use this endpoint to see which credentials will be needed to create a member for a specific institution.
    # @param institution_code The institution_code of the institution.
    # @param [Hash] opts the optional parameters
    # @return [CredentialsResponseBody]
    def read_institution_credentials(institution_code, opts = {})
      data, _status_code, _headers = read_institution_credentials_with_http_info(institution_code, opts)
      data
    end


  private

    # List institutions
    # This endpoint allows you to see what institutions are available for connection. Information returned will include the institution_code assigned to a particular institution, URLs for the financial institution&#39;s logo, and the URL for its website.&lt;br&gt; This endpoint takes an optional query string, name&#x3D;{string}. This will list only institutions in which the appended string appears. 
        # @param [Hash] opts the optional parameters
        # @option opts [String] :name This will list only institutions in which the appended string appears.
        # @option opts [Integer] :page Specify current page.
        # @option opts [Integer] :records_per_page Specify records per page.
        # @return [Array<(InstitutionsResponseBody, Fixnum, Hash)>] InstitutionsResponseBody data, response status code and response headers
    def list_institutions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstitutionsApi.list_institutions ...'
      end
      # resource path
      local_var_path = '/institutions'

      # query parameters
      query_params = {}
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
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
        :return_type => 'InstitutionsResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstitutionsApi#list_institutions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read institution
    # This endpoint allows you to see information for a specific institution.
        # @param institution_code The institution_code of the institution.
        # @param [Hash] opts the optional parameters
        # @return [Array<(InstitutionResponseBody, Fixnum, Hash)>] InstitutionResponseBody data, response status code and response headers
    def read_institution_with_http_info(institution_code, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstitutionsApi.read_institution ...'
      end
      # verify the required parameter 'institution_code' is set
      if @api_client.config.client_side_validation && institution_code.nil?
        fail ArgumentError, "Missing the required parameter 'institution_code' when calling InstitutionsApi.read_institution"
      end
      # resource path
      local_var_path = '/institutions/{institution_code}'.sub('{' + 'institution_code' + '}', institution_code.to_s)

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
        :return_type => 'InstitutionResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstitutionsApi#read_institution\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read institution credentials
    # Use this endpoint to see which credentials will be needed to create a member for a specific institution.
        # @param institution_code The institution_code of the institution.
        # @param [Hash] opts the optional parameters
        # @return [Array<(CredentialsResponseBody, Fixnum, Hash)>] CredentialsResponseBody data, response status code and response headers
    def read_institution_credentials_with_http_info(institution_code, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstitutionsApi.read_institution_credentials ...'
      end
      # verify the required parameter 'institution_code' is set
      if @api_client.config.client_side_validation && institution_code.nil?
        fail ArgumentError, "Missing the required parameter 'institution_code' when calling InstitutionsApi.read_institution_credentials"
      end
      # resource path
      local_var_path = '/institutions/{institution_code}/credentials'.sub('{' + 'institution_code' + '}', institution_code.to_s)

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
        @api_client.config.logger.debug "API called: InstitutionsApi#read_institution_credentials\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
