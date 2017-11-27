#!/usr/bin/env ruby
require "atrium"

::Atrium.configure do |config|
  config.mx_client_id = "YOUR_MX_CLIENT_ID"
  config.mx_api_key = "YOUR_MX_API_KEY"
end

puts "\n* Creating user and member with \"DENIED\" aggregation status *"
user = ::Atrium::User.create :identifier => nil, :is_disabled => nil, :metadata => nil
puts "Created user: " + user.guid

credential_one = {}
credential_one[:guid] = "CRD-9f61fb4c-912c-bd1e-b175-ccc7f0275cc1"
credential_one[:value] = "test_atrium"

credential_two = {}
credential_two[:guid] = "CRD-e3d7ea81-aac7-05e9-fbdd-4b493c6e474d"
credential_two[:value] = "INVALID"

credential_array = []
credential_array.push(credential_one)
credential_array.push(credential_two)

member = ::Atrium::Member.create :user_guid => user.guid, :institution_code => "mxbank", :credentials => credential_array
puts "Created member: " + member.guid

sleep(1)

puts "\n* Retrieving member aggregation status *"
aggregation_response = member.aggregation_status
puts "Member aggregation status: " + aggregation_response.status

puts "\n* Updating credentials *"
credentials = ::Atrium::Institution.credentials "mxbank"

username_credential = {}
username_credential[:guid] = credentials[0].guid
username_credential[:value] = "test_atrium"

password_credential = {}
password_credential[:guid] = credentials[1].guid
password_credential[:value] = "password"

updated_credentials = []
updated_credentials.push(username_credential)
updated_credentials.push(password_credential)

member.update(:credentials => updated_credentials)
sleep(1)

puts "\n* Retrieving member aggregation status *"
aggregation_response = member.aggregation_status
puts "Member aggregation status: " + aggregation_response.status

puts "\n* Deleting test user *"
user.delete
puts "Deleted user: " + user.guid
