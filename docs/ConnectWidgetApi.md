# Atrium::ConnectWidgetApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_connect_widget**](ConnectWidgetApi.md#get_connect_widget) | **POST** /users/{user_guid}/connect_widget_url | Embedding in a website


# **get_connect_widget**
> ConnectWidgetResponseBody get_connect_widget(user_guidbody)

Embedding in a website

This endpoint will return a URL for an embeddable version of MX Connect.

### Example
```ruby
# load the gem
require "atrium-ruby"

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

user_guid = "USR-123" # String | The unique identifier for a `user`.
body = Atrium::ConnectWidgetRequestBody.new # ConnectWidgetRequestBody | Optional config options for WebView (is_mobile_webview, current_institution_code, current_member_guid, update_credentials)

begin
  #Embedding in a website
  response = client.connectWidget.get_connect_widget(user_guidbody)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling ConnectWidgetApi->get_connect_widget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_guid** | **String**| The unique identifier for a &#x60;user&#x60;. | 
 **body** | [**ConnectWidgetRequestBody**](ConnectWidgetRequestBody.md)| Optional config options for WebView (is_mobile_webview, current_institution_code, current_member_guid, update_credentials) | 

### Return type

[**ConnectWidgetResponseBody**](ConnectWidgetResponseBody.md)

