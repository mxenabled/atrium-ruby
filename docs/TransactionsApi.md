# Atrium::TransactionsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**cleanse_and_categorize_transactions**](TransactionsApi.md#cleanse_and_categorize_transactions) | **POST** /transactions/cleanse_and_categorize | Categorize transactions
[**list_user_transactions**](TransactionsApi.md#list_user_transactions) | **GET** /users/{user_guid}/transactions | List transactions for a user
[**read_transaction**](TransactionsApi.md#read_transaction) | **GET** /users/{user_guid}/transactions/{transaction_guid} | Read a transaction


# **cleanse_and_categorize_transactions**
> TransactionsCleanseAndCategorizeResponseBody cleanse_and_categorize_transactions(body)

Categorize transactions

Use this endpoint to categorize, cleanse, and classify transactions. These transactions are not persisted or stored on the MX platform.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

body = Atrium::TransactionsCleanseAndCategorizeRequestBody.new # TransactionsCleanseAndCategorizeRequestBody | User object to be created with optional parameters (amount, type) amd required parameters (description, identifier)

begin
  #Categorize transactions
  response = client.transactions.cleanse_and_categorize_transactions(body)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling TransactionsApi->cleanse_and_categorize_transactions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionsCleanseAndCategorizeRequestBody**](TransactionsCleanseAndCategorizeRequestBody.md)| User object to be created with optional parameters (amount, type) amd required parameters (description, identifier) | 

### Return type

[**TransactionsCleanseAndCategorizeResponseBody**](TransactionsCleanseAndCategorizeResponseBody.md)

# **list_user_transactions**
> TransactionsResponseBody list_user_transactions(user_guid, , opts)

List transactions for a user

Use this endpoint to get all transactions that belong to a specific user, across all the user's members and accounts.<br> This endpoint accepts optional query parameters, from_date and to_date, which filter transactions according to the date they were posted. If no values are given, from_date will default to 90 days prior to the request, and to_date will default to 5 days from the time of the request. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  page: 1, # Integer | Specify current page.
  from_date: "2016-09-20", # String | Filter transactions from this date.
  records_per_page: 12 # Integer | Specify records per page.
  to_date: "2016-10-20" # String | Filter transactions to this date.
}

begin
  #List transactions for a user
  response = client.transactions.list_user_transactions(user_guid, , opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling TransactionsApi->list_user_transactions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **page** | **Integer**| Specify current page. | [optional] 
 **from_date** | **String**| Filter transactions from this date. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 
 **to_date** | **String**| Filter transactions to this date. | [optional] 

### Return type

[**TransactionsResponseBody**](TransactionsResponseBody.md)

# **read_transaction**
> TransactionResponseBody read_transaction(transaction_guid, user_guid, )

Read a transaction

This endpoint allows you to view information about a specific transaction that belongs to a user.<br>

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

transaction_guid = "TRN-123" # String | The unique identifier for a `transaction`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read a transaction
  response = client.transactions.read_transaction(transaction_guid, user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling TransactionsApi->read_transaction: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transaction_guid** | **String**| The unique identifier for a &#x60;transaction&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**TransactionResponseBody**](TransactionResponseBody.md)

