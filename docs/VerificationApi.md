# Atrium::VerificationApi

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

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read account numbers
  response = client.verification.list_account_numbers(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
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

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

account_guid = "ACT-123" # String | The unique identifier for an `account`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read account numbers by account GUID
  response = client.verification.list_account_numbers_by_account(account_guid, user_guid)
  p response
rescue Atrium::ApiError => e
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

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Verify
  response = client.verification.verify_member(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
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

