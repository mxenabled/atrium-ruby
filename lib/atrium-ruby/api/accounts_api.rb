=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'uri'

module MX
  class AccountsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # List account transactions
    # This endpoint allows you to see every transaction that belongs to a specific account. The default from_date is 90 days prior to the request, and the default to_date is 5 days from the time of the request.<br> The from_date and to_date parameters can optionally be appended to the request. 
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from_date Filter transactions from this date.
    # @option opts [String] :to_date Filter transactions to this date.
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [TransactionsResponseBody]
    def list_account_transactions(account_guid, user_guid, opts = {})
      data, _status_code, _headers = list_account_transactions_with_http_info(account_guid, user_guid, opts)
      data
    end

    # List accounts for a user
    # Use this endpoint to view information about every account that belongs to a user. You'll need the user's GUID to access this list. The information will include the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the account balance, the date the account was started, etc.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page Specify current page.
    # @option opts [Integer] :records_per_page Specify records per page.
    # @return [AccountsResponseBody]
    def list_user_accounts(user_guid, opts = {})
      data, _status_code, _headers = list_user_accounts_with_http_info(user_guid, opts)
      data
    end

    # Read an account
    # Reading an account allows you to get information about a specific account that belongs to a user. That includes the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the balance, the date the account was started, and much more.<br> There are two endpoints for reading an account. Both will return the same information.<br> It's important to remember that balance and available_balance will normally be positive numbers — for all account types. But this should be interpreted differently for debt accounts and asset accounts.<br> An asset account, e.g., CHECKING, SAVINGS, or INVESTMENT, will have a positive balance unless it is in an overdraft condition, in which case the balance will be negative.<br> On the other hand, a debt account, e.g., CREDIT CARD, LOAN, MORTGAGE, would have a positivebalance when the user owes money on the account. It would have a negative balance if the account has been overpaid. 
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [AccountResponseBody]
    def read_account(account_guid, user_guid, opts = {})
      data, _status_code, _headers = read_account_with_http_info(account_guid, user_guid, opts)
      data
    end

    # Read an account
    # Reading an account allows you to get information about a specific account that belongs to a user. That includes the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the balance, the date the account was started, and much more.<br> There are two endpoints for reading an account. Both will return the same information.<br> It's important to remember that balance and available_balance will normally be positive numbers — for all account types. But this should be interpreted differently for debt accounts and asset accounts.<br> An asset account, e.g., CHECKING, SAVINGS, or INVESTMENT, will have a positive balance unless it is in an overdraft condition, in which case the balance will be negative.<br> On the other hand, a debt account, e.g., CREDIT CARD, LOAN, MORTGAGE, would have a positivebalance when the user owes money on the account. It would have a negative balance if the account has been overpaid. 
    # @param account_guid The unique identifier for an &#x60;account&#x60;.
    # @param member_guid The unique identifier for a &#x60;member&#x60;.
    # @param user_guid The unique identifier for a &#x60;user&#x60;.
    # @param [Hash] opts the optional parameters
    # @return [AccountResponseBody]
    def read_account_by_member_guid(account_guid, member_guid, user_guid, opts = {})
      data, _status_code, _headers = read_account_by_member_guid_with_http_info(account_guid, member_guid, user_guid, opts)
      data
    end


  private

    # List account transactions
    # This endpoint allows you to see every transaction that belongs to a specific account. The default from_date is 90 days prior to the request, and the default to_date is 5 days from the time of the request.&lt;br&gt; The from_date and to_date parameters can optionally be appended to the request. 
        # @param account_guid The unique identifier for an &#x60;account&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @option opts [String] :from_date Filter transactions from this date.
        # @option opts [String] :to_date Filter transactions to this date.
        # @option opts [Integer] :page Specify current page.
        # @option opts [Integer] :records_per_page Specify records per page.
        # @return [Array<(TransactionsResponseBody, Fixnum, Hash)>] TransactionsResponseBody data, response status code and response headers
    def list_account_transactions_with_http_info(account_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.list_account_transactions ...'
      end
      # verify the required parameter 'account_guid' is set
      if @api_client.config.client_side_validation && account_guid.nil?
        fail ArgumentError, "Missing the required parameter 'account_guid' when calling AccountsApi.list_account_transactions"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling AccountsApi.list_account_transactions"
      end
      # resource path
      local_var_path = '/users/{user_guid}/accounts/{account_guid}/transactions'.sub('{' + 'account_guid' + '}', account_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        @api_client.config.logger.debug "API called: AccountsApi#list_account_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List accounts for a user
    # Use this endpoint to view information about every account that belongs to a user. You&#39;ll need the user&#39;s GUID to access this list. The information will include the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the account balance, the date the account was started, etc.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @option opts [Integer] :page Specify current page.
        # @option opts [Integer] :records_per_page Specify records per page.
        # @return [Array<(AccountsResponseBody, Fixnum, Hash)>] AccountsResponseBody data, response status code and response headers
    def list_user_accounts_with_http_info(user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.list_user_accounts ...'
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling AccountsApi.list_user_accounts"
      end
      # resource path
      local_var_path = '/users/{user_guid}/accounts'.sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        @api_client.config.logger.debug "API called: AccountsApi#list_user_accounts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read an account
    # Reading an account allows you to get information about a specific account that belongs to a user. That includes the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the balance, the date the account was started, and much more.&lt;br&gt; There are two endpoints for reading an account. Both will return the same information.&lt;br&gt; It&#39;s important to remember that balance and available_balance will normally be positive numbers — for all account types. But this should be interpreted differently for debt accounts and asset accounts.&lt;br&gt; An asset account, e.g., CHECKING, SAVINGS, or INVESTMENT, will have a positive balance unless it is in an overdraft condition, in which case the balance will be negative.&lt;br&gt; On the other hand, a debt account, e.g., CREDIT CARD, LOAN, MORTGAGE, would have a positivebalance when the user owes money on the account. It would have a negative balance if the account has been overpaid. 
        # @param account_guid The unique identifier for an &#x60;account&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(AccountResponseBody, Fixnum, Hash)>] AccountResponseBody data, response status code and response headers
    def read_account_with_http_info(account_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.read_account ...'
      end
      # verify the required parameter 'account_guid' is set
      if @api_client.config.client_side_validation && account_guid.nil?
        fail ArgumentError, "Missing the required parameter 'account_guid' when calling AccountsApi.read_account"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling AccountsApi.read_account"
      end
      # resource path
      local_var_path = '/users/{user_guid}/accounts/{account_guid}'.sub('{' + 'account_guid' + '}', account_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'AccountResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#read_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read an account
    # Reading an account allows you to get information about a specific account that belongs to a user. That includes the account type — e.g., CHECKING, MONEY_MARKET, or PROPERTY — the balance, the date the account was started, and much more.&lt;br&gt; There are two endpoints for reading an account. Both will return the same information.&lt;br&gt; It&#39;s important to remember that balance and available_balance will normally be positive numbers — for all account types. But this should be interpreted differently for debt accounts and asset accounts.&lt;br&gt; An asset account, e.g., CHECKING, SAVINGS, or INVESTMENT, will have a positive balance unless it is in an overdraft condition, in which case the balance will be negative.&lt;br&gt; On the other hand, a debt account, e.g., CREDIT CARD, LOAN, MORTGAGE, would have a positivebalance when the user owes money on the account. It would have a negative balance if the account has been overpaid. 
        # @param account_guid The unique identifier for an &#x60;account&#x60;.
        # @param member_guid The unique identifier for a &#x60;member&#x60;.
        # @param user_guid The unique identifier for a &#x60;user&#x60;.
        # @param [Hash] opts the optional parameters
        # @return [Array<(AccountResponseBody, Fixnum, Hash)>] AccountResponseBody data, response status code and response headers
    def read_account_by_member_guid_with_http_info(account_guid, member_guid, user_guid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.read_account_by_member_guid ...'
      end
      # verify the required parameter 'account_guid' is set
      if @api_client.config.client_side_validation && account_guid.nil?
        fail ArgumentError, "Missing the required parameter 'account_guid' when calling AccountsApi.read_account_by_member_guid"
      end
      # verify the required parameter 'member_guid' is set
      if @api_client.config.client_side_validation && member_guid.nil?
        fail ArgumentError, "Missing the required parameter 'member_guid' when calling AccountsApi.read_account_by_member_guid"
      end
      # verify the required parameter 'user_guid' is set
      if @api_client.config.client_side_validation && user_guid.nil?
        fail ArgumentError, "Missing the required parameter 'user_guid' when calling AccountsApi.read_account_by_member_guid"
      end
      # resource path
      local_var_path = '/users/{user_guid}/members/{member_guid}/accounts/{account_guid}'.sub('{' + 'account_guid' + '}', account_guid.to_s).sub('{' + 'member_guid' + '}', member_guid.to_s).sub('{' + 'user_guid' + '}', user_guid.to_s)

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
        :return_type => 'AccountResponseBody')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#read_account_by_member_guid\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
