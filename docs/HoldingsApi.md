# Atrium::HoldingsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_holdings**](HoldingsApi.md#list_holdings) | **GET** /users/{user_guid}/holdings | List holdings
[**list_holdings_by_account**](HoldingsApi.md#list_holdings_by_account) | **GET** /users/{user_guid}/accounts/{account_guid}/holdings | List holdings by account
[**list_holdings_by_member**](HoldingsApi.md#list_holdings_by_member) | **GET** /users/{user_guid}/members/{member_guid}/holdings | List holdings by member
[**read_holding**](HoldingsApi.md#read_holding) | **GET** /users/{user_guid}/holdings/{holding_guid} | Read holding


# **list_holdings**
> HoldingsResponseBody list_holdings(user_guid, )

List holdings

Use this endpoint to read all holdings associated with a specific user.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #List holdings
  response = client.holdings.list_holdings(user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling HoldingsApi->list_holdings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**HoldingsResponseBody**](HoldingsResponseBody.md)

# **list_holdings_by_account**
> HoldingsResponseBody list_holdings_by_account(account_guid, user_guid, )

List holdings by account

Use this endpoint to read all holdings associated with a specific account.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

account_guid = "ACT-123" # String | The unique identifier for an `account`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #List holdings by account
  response = client.holdings.list_holdings_by_account(account_guid, user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling HoldingsApi->list_holdings_by_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_guid** | **String**| The unique identifier for an &#x60;account&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**HoldingsResponseBody**](HoldingsResponseBody.md)

# **list_holdings_by_member**
> HoldingsResponseBody list_holdings_by_member(member_guid, user_guid, )

List holdings by member

Use this endpoint to read all holdings associated with a specific member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #List holdings by member
  response = client.holdings.list_holdings_by_member(member_guid, user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling HoldingsApi->list_holdings_by_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**HoldingsResponseBody**](HoldingsResponseBody.md)

# **read_holding**
> HoldingResponseBody read_holding(holding_guid, user_guid, )

Read holding

Use this endpoint to read the attributes of a specific holding.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

holding_guid = "HOL-123" # String | The unique identifier for a `holding`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read holding
  response = client.holdings.read_holding(holding_guid, user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling HoldingsApi->read_holding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **holding_guid** | **String**| The unique identifier for a &#x60;holding&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**HoldingResponseBody**](HoldingResponseBody.md)

