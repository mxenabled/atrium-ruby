# Atrium::MerchantsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**read_merchant**](MerchantsApi.md#read_merchant) | **GET** /merchants/{merchant_guid} | Read merchant


# **read_merchant**
> MerchantResponseBody read_merchant(merchant_guid)

Read merchant

Returns information about a particular merchant, such as a logo, name, and website.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

merchant_guid = "MCH-123" # String | The unique identifier for a `merchant`.

begin
  #Read merchant
  response = client.merchants.read_merchant(merchant_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MerchantsApi->read_merchant: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_guid** | **String**| The unique identifier for a &#x60;merchant&#x60;. | 

### Return type

[**MerchantResponseBody**](MerchantResponseBody.md)

