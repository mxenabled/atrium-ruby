# MX::VerificationApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_account_numbers**](VerificationApi.md#list_account_numbers) | **GET** /users/{user_guid}/members/{member_guid}/account_numbers | Read account numbers
[**list_account_numbers_by_account**](VerificationApi.md#list_account_numbers_by_account) | **GET** /users/{user_guid}/accounts/{account_guid}/account_numbers | Read account numbers by account GUID
[**verify_member**](VerificationApi.md#verify_member) | **POST** /users/{user_guid}/members/{member_guid}/verify | Verify


# **list_account_numbers**
> AccountNumbersResponseBody list_account_numbers(member_guid, user_guid)

Read account numbers

Use this endpoint to check whether account and routing numbers are available for accounts associated with a particular member. It returns the account_numbers object, which contains account and routing number data for each account associated with the member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

# setup authorization
MX.configure do |config|
  # Configure API Key authorization
  config.api_key['MX-API-Key'] = 'YOUR_API_KEY'

  # Configure Client ID authorization
  config.api_key['MX-Client-ID'] = 'YOUR_CLIENT_ID'
end

api_instance = MX::VerificationApi.new

member_guid = 'member_guid_example' # String | The unique identifier for a `member`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.


begin
  #Read account numbers
  result = api_instance.list_account_numbers(member_guid, user_guid)
  p result
rescue MX::ApiError => e
  puts "Exception when calling VerificationApi->list_account_numbers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**AccountNumbersResponseBody**](AccountNumbersResponseBody.md)

# **list_account_numbers_by_account**
> AccountNumbersResponseBody list_account_numbers_by_account(account_guid, user_guid)

Read account numbers by account GUID

Use this endpoint to check whether account and routing numbers are available for a specific account. It returns the account_numbers object, which contains account and routing number data.

### Example
```ruby
# load the gem
require 'atrium-ruby'

# setup authorization
MX.configure do |config|
  # Configure API Key authorization
  config.api_key['MX-API-Key'] = 'YOUR_API_KEY'

  # Configure Client ID authorization
  config.api_key['MX-Client-ID'] = 'YOUR_CLIENT_ID'
end

api_instance = MX::VerificationApi.new

account_guid = 'account_guid_example' # String | The unique identifier for an `account`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.


begin
  #Read account numbers by account GUID
  result = api_instance.list_account_numbers_by_account(account_guid, user_guid)
  p result
rescue MX::ApiError => e
  puts "Exception when calling VerificationApi->list_account_numbers_by_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_guid** | **String**| The unique identifier for an &#x60;account&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**AccountNumbersResponseBody**](AccountNumbersResponseBody.md)

# **verify_member**
> MemberResponseBody verify_member(member_guid, user_guid)

Verify

The verify endpoint begins a verification process for a member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

# setup authorization
MX.configure do |config|
  # Configure API Key authorization
  config.api_key['MX-API-Key'] = 'YOUR_API_KEY'

  # Configure Client ID authorization
  config.api_key['MX-Client-ID'] = 'YOUR_CLIENT_ID'
end

api_instance = MX::VerificationApi.new

member_guid = 'member_guid_example' # String | The unique identifier for a `member`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.


begin
  #Verify
  result = api_instance.verify_member(member_guid, user_guid)
  p result
rescue MX::ApiError => e
  puts "Exception when calling VerificationApi->verify_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

