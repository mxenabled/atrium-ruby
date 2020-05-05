# Atrium::MerchantsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_merchant_locations**](MerchantsApi.md#list_merchant_locations) | **GET** /merchants/{merchant_guid}/merchant_locations | List merchant locations
[**list_merchants**](MerchantsApi.md#list_merchants) | **GET** /merchants | List merchants
[**read_merchant**](MerchantsApi.md#read_merchant) | **GET** /merchants/{merchant_guid} | Read merchant
[**read_merchant_location**](MerchantsApi.md#read_merchant_location) | **GET** /merchants/{merchant_guid}/merchant_locations/{merchant_location_guid} | Read merchant location


# **list_merchant_locations**
> MerchantLocationsResponseBody list_merchant_locations(merchant_guid, )

List merchant locations

Returns a list of all the merchant locations associated with a merchant, including physical location, latitude, longitude, etc.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

merchant_guid = "MCH-123" # String | The unique identifier for a `merchant`.

begin
  #List merchant locations
  response = client.merchants.list_merchant_locations(merchant_guid, )
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MerchantsApi->list_merchant_locations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_guid** | **String**| The unique identifier for a &#x60;merchant&#x60;. | 

### Return type

[**MerchantLocationsResponseBody**](MerchantLocationsResponseBody.md)

# **list_merchants**
> MerchantsResponseBody list_merchants

List merchants

Returns a list of merchnants.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

begin
  #List merchants
  response = client.merchants.list_merchants
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MerchantsApi->list_merchants: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MerchantsResponseBody**](MerchantsResponseBody.md)

# **read_merchant**
> MerchantResponseBody read_merchant(merchant_guid, )

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
  response = client.merchants.read_merchant(merchant_guid, )
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

# **read_merchant_location**
> MerchantLocationResponseBody read_merchant_location(merchant_guid, merchant_location_guid)

Read merchant location

Retuns a specific location associated with a merchant, including physical location, latitude, longitude, etc.

### Example
```ruby
# load the gem
require 'atrium-ruby'

client = Atrium::AtriumClient.new("YOUR_API_KEY", "YOUR_CLIENT_ID")

merchant_guid = "MCH-123" # String | The unique identifier for a `merchant`.
merchant_location_guid = "MCL-123" # String | The unique identifier for a `merchant_location`.

begin
  #Read merchant location
  response = client.merchants.read_merchant_location(merchant_guid, merchant_location_guid)
  p response
rescue Atrium::ApiError => e
  puts "Exception when calling MerchantsApi->read_merchant_location: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_guid** | **String**| The unique identifier for a &#x60;merchant&#x60;. | 
 **merchant_location_guid** | **String**| The unique identifier for a &#x60;merchant_location&#x60;. | 

### Return type

[**MerchantLocationResponseBody**](MerchantLocationResponseBody.md)

