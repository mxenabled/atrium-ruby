# Atrium::MembersApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**aggregate_member**](MembersApi.md#aggregate_member) | **POST** /users/{user_guid}/members/{member_guid}/aggregate | Aggregate member
[**create_member**](MembersApi.md#create_member) | **POST** /users/{user_guid}/members | Create member
[**delete_member**](MembersApi.md#delete_member) | **DELETE** /users/{user_guid}/members/{member_guid} | Delete member
[**extend_history**](MembersApi.md#extend_history) | **POST** /users/{user_guid}/members/{member_guid}/extend_history | Extend history
[**list_member_accounts**](MembersApi.md#list_member_accounts) | **GET** /users/{user_guid}/members/{member_guid}/accounts | List member accounts
[**list_member_credentials**](MembersApi.md#list_member_credentials) | **GET** /users/{user_guid}/members/{member_guid}/credentials | List member credentials
[**list_member_mfa_challenges**](MembersApi.md#list_member_mfa_challenges) | **GET** /users/{user_guid}/members/{member_guid}/challenges | List member MFA challenges
[**list_member_transactions**](MembersApi.md#list_member_transactions) | **GET** /users/{user_guid}/members/{member_guid}/transactions | List member transactions
[**list_members**](MembersApi.md#list_members) | **GET** /users/{user_guid}/members | List members
[**read_member**](MembersApi.md#read_member) | **GET** /users/{user_guid}/members/{member_guid} | Read member
[**read_member_status**](MembersApi.md#read_member_status) | **GET** /users/{user_guid}/members/{member_guid}/status | Read member connection status
[**resume_member**](MembersApi.md#resume_member) | **PUT** /users/{user_guid}/members/{member_guid}/resume | Resume aggregation from MFA
[**update_member**](MembersApi.md#update_member) | **PUT** /users/{user_guid}/members/{member_guid} | Update member


# **aggregate_member**
> MemberResponseBody aggregate_member(member_guid, user_guid)

Aggregate member

Calling this endpoint initiates an aggregation event for the member. This brings in the latest account and transaction data from the connected institution. If this data has recently been updated, MX may not initiate an aggregation event. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Aggregate member
  response = client.members.aggregate_member(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->aggregate_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **create_member**
> MemberResponseBody create_member(user_guidbody)

Create member

This endpoint allows you to create a new member. Members are created with the required parameters credentials and institution_code, and the optional parameters identifier and metadata.<br> When creating a member, you'll need to include the correct type of credential required by the financial institution and provided by the user. You can find out which credential type is required with the /institutions/{institution_code}/credentials endpoint.<br> If successful, Atrium will respond with the newly-created member object.<br> Once you successfully create a member, MX will immediately validate the provided credentials and attempt to aggregate data for accounts and transactions. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.
body = Atrium::MemberCreateRequestBody.new # MemberCreateRequestBody | Member object to be created with optional parameters (identifier and metadata) and required parameters (credentials and institution_code)

begin
  #Create member
  response = client.members.create_member(user_guidbody)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->create_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **body** | [**MemberCreateRequestBody**](MemberCreateRequestBody.md)| Member object to be created with optional parameters (identifier and metadata) and required parameters (credentials and institution_code) | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **delete_member**
> delete_member(member_guid, user_guid)

Delete member

Accessing this endpoint will permanently delete a member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Delete member
  client.members.delete_member(member_guid, user_guid)
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->delete_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

nil (empty response body)

# **extend_history**
> MemberResponseBody extend_history(member_guid, user_guid)

Extend history

The extend_history endpoint begins the process of fetching up to 24 months of data associated with a particular `member`.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Extend history
  response = client.members.extend_history(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->extend_history: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **list_member_accounts**
> AccountsResponseBody list_member_accounts(member_guid, user_guid, opts)

List member accounts

This endpoint returns an array with information about every account associated with a particular member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  page: 1, # Integer | Specify current page.
  records_per_page: 12 # Integer | Specify records per page.
}

begin
  #List member accounts
  response = client.members.list_member_accounts(member_guid, user_guid, opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->list_member_accounts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **page** | **Integer**| Specify current page. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 

### Return type

[**AccountsResponseBody**](AccountsResponseBody.md)

# **list_member_credentials**
> CredentialsResponseBody list_member_credentials(member_guid, user_guid)

List member credentials

This endpoint returns an array which contains information on every non-MFA credential associated with a specific member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #List member credentials
  response = client.members.list_member_credentials(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->list_member_credentials: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**CredentialsResponseBody**](CredentialsResponseBody.md)

# **list_member_mfa_challenges**
> ChallengesResponseBody list_member_mfa_challenges(member_guid, user_guid)

List member MFA challenges

Use this endpoint for information on what multi-factor authentication challenges need to be answered in order to aggregate a member.<br> If the aggregation is not challenged, i.e., the member does not have a connection status of CHALLENGED, then code 204 No Content will be returned.<br> If the aggregation has been challenged, i.e., the member does have a connection status of CHALLENGED, then code 200 OK will be returned — along with the corresponding credentials. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #List member MFA challenges
  response = client.members.list_member_mfa_challenges(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->list_member_mfa_challenges: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**ChallengesResponseBody**](ChallengesResponseBody.md)

# **list_member_transactions**
> TransactionsResponseBody list_member_transactions(member_guid, user_guid, opts)

List member transactions

Use this endpoint to get all transactions from all accounts associated with a specific member.<br> This endpoint accepts optional URL query parameters — from_date and to_date — which are used to filter transactions according to the date they were posted. If no values are given for the query parameters, from_date will default to 90 days prior to the request and to_date will default to 5 days from the time of the request. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  from_date: "2016-09-20", # String | Filter transactions from this date.
  to_date: "2016-10-20" # String | Filter transactions to this date.
  page: 1, # Integer | Specify current page.
  records_per_page: 12 # Integer | Specify records per page.
}

begin
  #List member transactions
  response = client.members.list_member_transactions(member_guid, user_guid, opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->list_member_transactions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **from_date** | **String**| Filter transactions from this date. | [optional] 
 **to_date** | **String**| Filter transactions to this date. | [optional] 
 **page** | **Integer**| Specify current page. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 

### Return type

[**TransactionsResponseBody**](TransactionsResponseBody.md)

# **list_members**
> MembersResponseBody list_members(user_guid, opts)

List members

This endpoint returns an array which contains information on every member associated with a specific user.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  page: 1, # Integer | Specify current page.
  records_per_page: 12 # Integer | Specify records per page.
}

begin
  #List members
  response = client.members.list_members(user_guid, opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->list_members: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **page** | **Integer**| Specify current page. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 

### Return type

[**MembersResponseBody**](MembersResponseBody.md)

# **read_member**
> MemberResponseBody read_member(member_guid, user_guid)

Read member

Use this endpoint to read the attributes of a specific member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read member
  response = client.members.read_member(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->read_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **read_member_status**
> MemberConnectionStatusResponseBody read_member_status(member_guid, user_guid)

Read member connection status

This endpoint provides the status of the member's most recent aggregation event. This is an important step in the aggregation process, and the results returned by this endpoint should determine what you do next in order to successfully aggregate a member.<br> MX has introduced new, more detailed information on the current status of a member's connection to a financial institution and the state of its aggregation: the connection_status field. These are intended to replace and expand upon the information provided in the status field, which will soon be deprecated; support for the status field remains for the time being. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Read member connection status
  response = client.members.read_member_status(member_guid, user_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->read_member_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberConnectionStatusResponseBody**](MemberConnectionStatusResponseBody.md)

# **resume_member**
> MemberResponseBody resume_member(member_guid, user_guidbody)

Resume aggregation from MFA

This endpoint answers the challenges needed when a member has been challenged by multi-factor authentication.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
body = Atrium::MemberResumeRequestBody.new # MemberResumeRequestBody | Member object with MFA challenge answers

begin
  #Resume aggregation from MFA
  response = client.members.resume_member(member_guid, user_guidbody)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->resume_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **body** | [**MemberResumeRequestBody**](MemberResumeRequestBody.md)| Member object with MFA challenge answers | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **update_member**
> MemberResponseBody update_member(member_guid, user_guid, opts)

Update member

Use this endpoint to update a member's attributes. Only the credentials, identifier, and metadata parameters can be updated. To get a list of the required credentials for the member, use the list member credentials endpoint. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
opts = { 
  body: Atrium::MemberUpdateRequestBody.new # MemberUpdateRequestBody | Member object to be updated with optional parameters (credentials, identifier, metadata)
}

begin
  #Update member
  response = client.members.update_member(member_guid, user_guid, opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MembersApi->update_member: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **body** | [**MemberUpdateRequestBody**](MemberUpdateRequestBody.md)| Member object to be updated with optional parameters (credentials, identifier, metadata) | [optional] 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

