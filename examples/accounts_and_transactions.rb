#!/usr/bin/env ruby
require "atrium"

::Atrium.configure do |config|
  config.mx_client_id = "YOUR_MX_CLIENT_ID"
  config.mx_api_key = "YOUR_MX_API_KEY"
end

puts "\n* Creating test user and member *"
user = ::Atrium::User.create :identifier => nil, :is_disabled => nil, :metadata => nil
puts "Created user: " + user.guid

credential_one = {}
credential_one[:guid] = "CRD-9f61fb4c-912c-bd1e-b175-ccc7f0275cc1"
credential_one[:value] = "test_atrium"

credential_two = {}
credential_two[:guid] = "CRD-e3d7ea81-aac7-05e9-fbdd-4b493c6e474d"
credential_two[:value] = "password"

credential_array = []
credential_array.push(credential_one)
credential_array.push(credential_two)

member = ::Atrium::Member.create :user_guid => user.guid, :institution_code => "mxbank", :credentials => credential_array
puts "Created member: " + member.guid

sleep(1)

puts "\n* Aggregating Member *"
member.aggregate

sleep(4)
puts "Member aggregation status: " + member.status

puts "\n* Listing all member accounts and transactions *"
accounts = member.accounts
accounts.each do |account|
  puts "\nType: " + account.type + "\tName: " + account.name + "\tAvailable Balance: " + account.available_balance.to_s + "\tAvailable Credit: " + account.available_credit.to_s
  puts "Transactions"
  transactions = account.transactions
  transactions.each do |transaction|
    puts "\tDate: " + transaction.date + "\tDescription: " + transaction.description + "\tAmount: " + transaction.amount.to_s
  end
end

puts "\n* Deleting test user *"
user.delete
puts "Deleted user: " + user.guid
