=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module MX
  class TransactionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Categorize transactions
    # Use this endpoint to categorize, cleanse, and classify transactions. These transactions are not persisted or stored on the MX platform.
    # @param body User object to be created with optional parameters (amount, type) amd required parameters (description, identifier)
    # @param [Hash] opts the optional parameters
    # @return [TransactionsCleanseAndCategorizeResponseBody]
    def cleanse_and_categorize_transactions(body, opts = {})
      data, _status_code, _headers = cleanse_and_categorize_transactions_with_http_info(body, opts)
      data
    end

    # List transactions for a user
    # Use this endpoint to get all transactions that belong to a specific user, across all the user's members and accounts.<br> This endpoint accepts optional query parameters, from_date and to_date, which filter transactions according to the date they were posted. If no values are given, from_date will default to 90 days prior to the request, and to_date will default to 5 days from the time of the request. 
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [String] :from_date Filter transactions from this date.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @option opts [String] :to_date Filter transactions to this date.
    # @return [TransactionsResponseBody]
    def list_user_transactions(user_guid, opts = {})
      data, _status_code, _headers = list_user_transactions_with_http_info(user_guid, opts)
      data
    end

    # Read a transaction
    # This endpoint allows you to view information about a specific transaction that belongs to a user.<br>
    # @param transaction_guid The unique identifier for a &#x60;transaction&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [TransactionResponseBody]
    def read_transaction(transaction_guid, user_guid, opts = {})
      data, _status_code, _headers = read_transaction_with_http_info(transaction_guid, user_guid, opts)
      data
    end


  private

    # Categorize transactions
    # Use this endpoint to categorize, cleanse, and classify transactions. These transactions are not persisted or stored on the MX platform.
        # @param body User object to be created with optional parameters (amount, type) amd required parameters (description, identifier)
        # @param [Hash] opts the optional parameters
        # @return [Array<(TransactionsCleanseAndCategorizeResponseBody, Fixnum, Hash)>] TransactionsCleanseAndCategorizeResponseBody data, response status code and response headers
    def cleanse_and_categorize_transactions_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.cleanse_and_categorize_transactions ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling TransactionsApi.cleanse_and_categorize_transactions"
      end
      # resource path
      local_var_path = '/cleanse_and_categorize'

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
        :return_type => 'TransactionsCleanseAndCategorizeResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#cleanse_and_categorize_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List transactions for a user
    # Use this endpoint to get all transactions that belong to a specific user, across all the user&#39;s members and accounts.&lt;br&gt; This endpoint accepts optional query parameters, from_date and to_date, which filter transactions according to the date they were posted. If no values are given, from_date will default to 90 days prior to the request, and to_date will default to 5 days from the time of the request. 
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @option opts [Integer] :page Specify current page.
        # @option opts [String] :from_date Filter transactions from this date.
        # @option opts [Integer] :records_per_page Specify records per page.
        # @option opts [String] :to_date Filter transactions to this date.
        # @return [Array<(TransactionsResponseBody, Fixnum, Hash)>] TransactionsResponseBody data, response status code and response headers
    def list_user_transactions_with_http_info(user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.list_user_transactions ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling TransactionsApi.list_user_transactions"
      end
      # resource path
      local_var_path = '/users/{user_guid}/transactions'.sub('{' + 'user_guid' + '}', user_guid.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'from_date'] = opts[:'from_date'] if !opts[:'from_date'].nil?
      query_params[:'records_per_page'] = opts[:'records_per_page'] if !opts[:'records_per_page'].nil?
      query_params[:'to_date'] = opts[:'to_date'] if !opts[:'to_date'].nil?

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
        @api_client.config.logger.debug "API called: TransactionsApi#list_user_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read a transaction
    # This endpoint allows you to view information about a specific transaction that belongs to a user.&lt;br&gt;
        # @param transaction_guid The unique identifier for a &#x60;transaction&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(TransactionResponseBody, Fixnum, Hash)>] TransactionResponseBody data, response status code and response headers
    def read_transaction_with_http_info(transaction_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.read_transaction ...'
      end
      # verify the required parameter 'transaction_guid' is set
      if @api_client.config.client_side_validation && transaction_guid.nil?
        fail ArgumentError, "Missing the required parameter 'transaction_guid' when calling TransactionsApi.read_transaction"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling TransactionsApi.read_transaction"
      end
      # resource path
      local_var_path = '/users/{user_guid}/transactions/{transaction_guid}'.sub('{' + 'transaction_guid' + '}', transaction_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'TransactionResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#read_transaction\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
