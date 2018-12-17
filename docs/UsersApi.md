# Atrium::UsersApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_user**](UsersApi.md#create_user) | **POST** /users | Create user
[**delete_user**](UsersApi.md#delete_user) | **DELETE** /users/{user_guid} | Delete user
[**list_users**](UsersApi.md#list_users) | **GET** /users | List users
[**read_user**](UsersApi.md#read_user) | **GET** /users/{user_guid} | Read user
[**update_user**](UsersApi.md#update_user) | **PUT** /users/{user_guid} | Update user


# **create_user**
> UserResponseBody create_user(body)

Create user

Call this endpoint to create a new user. Atrium will respond with the newly-created user object if successful. This endpoint accepts several parameters: identifier, metadata, and is_disabled.<br> Disabling a user means that accounts and transactions associated with it will not be updated in the background by MX. It will also restrict access to that user's data until they are no longer disabled. Users who are disabled for the entirety of an Atrium billing period will not be factored into that month's bill. 

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

body = Atrium::UserCreateRequestBody.new # UserCreateRequestBody | User object to be created with optional parameters (identifier, is_disabled, metadata)

begin
  #Create user
  response = client.users.create_user(body)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling UsersApi->create_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserCreateRequestBody**](UserCreateRequestBody.md)| User object to be created with optional parameters (identifier, is_disabled, metadata) | 

### Return type

[**UserResponseBody**](UserResponseBody.md)

# **delete_user**
> delete_user(user_guid)

Delete user

Calling this endpoint will permanently delete a user from Atrium. If successful, the API will respond with Status: 204 No Content. 

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Delete user
  client.users.delete_user(user_guid)
rescue Atrium::ApiError => e
  puts "Exception when calling UsersApi->delete_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

nil (empty response body)

# **list_users**
> UsersResponseBody list_users(opts)

List users

Use this endpoint to list every user you've created in Atrium.

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

opts = { 
  page: 1, # Integer | Specify current page.
  records_per_page: 12, # Integer | Specify records per page.
}

begin
  #List users
  response = client.users.list_users(opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling UsersApi->list_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**| Specify current page. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 

### Return type

[**UsersResponseBody**](UsersResponseBody.md)

# **read_user**
> UserResponseBody read_user(user_guid)

Read user

Use this endpoint to read the attributes of a specific user.

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read user
  response = client.users.read_user(user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling UsersApi->read_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**UserResponseBody**](UserResponseBody.md)

# **update_user**
> UserResponseBody update_user(user_guid, opts)

Update user

Use this endpoint to update the attributes of a specific user. Atrium will respond with the updated user object.<br> Disabling a user means that accounts and transactions associated with it will not be updated in the background by MX. It will also restrict access to that user's data until they are no longer disabled. Users who are disabled for the entirety of an Atrium billing period will not be factored into that month's bill.<br> To disable a user, update it and set the is_disabled parameter to true. Set it to false to re-enable the user. 

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  body: Atrium::UserUpdateRequestBody.new # UserUpdateRequestBody | User object to be updated with optional parameters (identifier, is_disabled, metadata)
}

begin
  #Update user
  response = client.users.update_user(user_guid, opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling UsersApi->update_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **body** | [**UserUpdateRequestBody**](UserUpdateRequestBody.md)| User object to be updated with optional parameters (identifier, is_disabled, metadata) | [optional] 

### Return type

[**UserResponseBody**](UserResponseBody.md)

