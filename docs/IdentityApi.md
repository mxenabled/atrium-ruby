# MX::IdentityApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**identify_member**](IdentityApi.md#identify_member) | **POST** /users/{user_guid}/members/{member_guid}/identify | Identify
[**list_account_owners**](IdentityApi.md#list_account_owners) | **GET** /users/{user_guid}/members/{member_guid}/account_owners | List member account owners


# **identify_member**
> MemberResponseBody identify_member(member_guid, user_guid)

Identify

The identify endpoint begins an identification process for an already-existing member.

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

api_instance = MX::IdentityApi.new

member_guid = 'member_guid_example' # String | The unique identifier for a `member`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.


begin
  #Identify
  result = api_instance.identify_member(member_guid, user_guid)
  p result
rescue MX::ApiError => e
  puts "Exception when calling IdentityApi->identify_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **list_account_owners**
> AccountOwnersResponseBody list_account_owners(member_guid, user_guid)

List member account owners

This endpoint returns an array with information about every account associated with a particular member.

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

api_instance = MX::IdentityApi.new

member_guid = 'member_guid_example' # String | The unique identifier for a `member`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.


begin
  #List member account owners
  result = api_instance.list_account_owners(member_guid, user_guid)
  p result
rescue MX::ApiError => e
  puts "Exception when calling IdentityApi->list_account_owners: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**AccountOwnersResponseBody**](AccountOwnersResponseBody.md)

