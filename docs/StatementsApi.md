# Atrium::StatementsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_statement_pdf**](StatementsApi.md#download_statement_pdf) | **GET** /users/{user_guid}/members/{member_guid}/statements/{statement_guid}.pdf | Download statement PDF
[**fetch_statements**](StatementsApi.md#fetch_statements) | **POST** /users/{user_guid}/members/{member_guid}/fetch_statements | Fetch statements
[**list_member_statements**](StatementsApi.md#list_member_statements) | **GET** /users/{user_guid}/members/{member_guid}/statements | List member statements
[**read_member_statement**](StatementsApi.md#read_member_statement) | **GET** /users/{user_guid}/members/{member_guid}/statements/{statement_guid} | Read statement JSON


# **download_statement_pdf**
> File download_statement_pdf(member_guid, user_guid, statement_guid)

Download statement PDF

Use this endpoint to download a specified statement. The endpoint URL is the same as the URI given in each `statement` object. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
statement_guid = "STA-123" # String | The unique identifier for an `statement`.

begin
  #Download statement PDF
  response = client.statements.download_statement_pdf(member_guid, user_guid, statement_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling StatementsApi->download_statement_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **statement_guid** | **String**| The unique identifier for an &#x60;statement&#x60;. | 

### Return type

**File**

# **fetch_statements**
> MemberResponseBody fetch_statements(member_guid, user_guid, )

Fetch statements

The fetch statements endpoint begins fetching statements for a member.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.

begin
  #Fetch statements
  response = client.statements.fetch_statements(member_guid, user_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling StatementsApi->fetch_statements: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 

### Return type

[**MemberResponseBody**](MemberResponseBody.md)

# **list_member_statements**
> StatementsResponseBody list_member_statements(member_guid, user_guid, , opts)

List member statements

Certain institutions in Atrium allow developers to access account statements associated with a particular `member`. Use this endpoint to get an array of available statements.  Before this endpoint can be used, `fetch_statements` should be performed on the relevant `member`. 

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
  #List member statements
  response = client.statements.list_member_statements(member_guid, user_guid, , opts)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling StatementsApi->list_member_statements: #{e}"
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

[**StatementsResponseBody**](StatementsResponseBody.md)

# **read_member_statement**
> StatementResponseBody read_member_statement(member_guid, user_guid, statement_guid)

Read statement JSON

Use this endpoint to download a specified statement. The endpoint URL is the same as the URI given in each `statement` object. 

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

member_guid = "MBR-123" # String | The unique identifier for a `member`.
user_guid = "USR-123" # String | The unique identifier for a `user`.
statement_guid = "STA-123" # String | The unique identifier for an `statement`.

begin
  #Read statement JSON
  response = client.statements.read_member_statement(member_guid, user_guid, statement_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling StatementsApi->read_member_statement: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **member_guid** | **String**| The unique identifier for a &#x60;member&#x60;. | 
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **statement_guid** | **String**| The unique identifier for an &#x60;statement&#x60;. | 

### Return type

[**StatementResponseBody**](StatementResponseBody.md)

