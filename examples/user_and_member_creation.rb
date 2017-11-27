#!/usr/bin/env ruby
require "atrium"

::Atrium.configure do |config|
  config.mx_client_id = "YOUR_MX_CLIENT_ID"
  config.mx_api_key = "YOUR_MX_API_KEY"
end

puts "\n* Creating user *"
user = ::Atrium::User.create :identifier => nil, :is_disabled => nil, :metadata => nil
puts user.guid

puts "\n* Listing institutions with query string \"bank\" *"
name = "bank"
params = { :name => name }
institutions = ::Atrium::Institution.list :query_params => params
institutions.each do |institution|
  puts institution.name + " : institution code = " + institution.code
end

puts "\n* Reading institution \"mxbank\" *"
institution = ::Atrium::Institution.read :institution_code => "mxbank"
puts institution.name

puts "\n* Reading institution credentials \"mxbank\" *"
credentials = ::Atrium::Institution.credentials "chase"
credentials.each do |credential|
  puts credential.guid
end

puts "\n* Creating member *"

# Create credential JSON object
credential_one = {}
credential_one[:guid] = "CRD-9f61fb4c-912c-bd1e-b175-ccc7f0275cc1"
credential_one[:value] = "test_atrium"

# Create another credential JSON object
credential_two = {}
credential_two[:guid] = "CRD-e3d7ea81-aac7-05e9-fbdd-4b493c6e474d"
credential_two[:value] = "password"

# Create credential array from credential JSON Objects
credential_array = []
credential_array.push(credential_one)
credential_array.push(credential_two)

member = ::Atrium::Member.create :user_guid => user.guid, :institution_code => "mxbank", :credentials => credential_array
puts member.guid

puts "\n* Deleting test user *"
user.delete
puts "Deleted user: " + user.guid
