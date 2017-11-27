#!/usr/bin/env ruby
require "atrium"

::Atrium.configure do |config|
  config.mx_client_id = "YOUR_MX_CLIENT_ID"
  config.mx_api_key = "YOUR_MX_API_KEY"
end

puts "\n************************** Create User **************************"
user = ::Atrium::User.create :identifier => "unique_id", :is_disabled => "", :metadata => "{\"first_name\": \"Steven\"}"
puts user.guid
user_guid = user.guid

puts "\n************************** Read User **************************"
user = ::Atrium::User.read :guid => user_guid
puts user.guid

puts "\n************************** Update User **************************"
user = ::Atrium::User.read :guid => user_guid
user = user.update :metadata => "{\"first_name\": \"Steven\", \"last_name\": \"Universe\"}"
puts user.guid

puts "\n************************** List Users **************************"
users = ::Atrium::User.list
users.each do |a_user|
  puts a_user.guid
end

puts "\n************************** List Institutions **************************"
name = "bank"
params = { :name => name }
institutions = ::Atrium::Institution.list :query_params => params
institutions.each do |institution|
  puts institution.name
end

puts "\n************************** Read Institution **************************"
institution = ::Atrium::Institution.read :institution_code => "mxbank"
puts institution.name

puts "\n************************** Read Institution Credentials ************************** "
credentials = ::Atrium::Institution.credentials "mxbank"
credentials.each do |credential|
  puts credential.guid
end

puts "\n************************** Create Member **************************"
# Create credential JSON object
credential_one = {}
credential_one[:guid] = "CRD-9f61fb4c-912c-bd1e-b175-ccc7f0275cc1"
credential_one[:value] = "test_atrium1"

# Create another credential JSON object
credential_two = {}
credential_two[:guid] = "CRD-e3d7ea81-aac7-05e9-fbdd-4b493c6e474d"
credential_two[:value] = "challenge1"

# Create credential array from credential JSON Objects
credential_array = []
credential_array.push(credential_one)
credential_array.push(credential_two)

member = ::Atrium::Member.create :user_guid => user_guid, :institution_code => "mxbank", :credentials => credential_array
puts member.guid
member_guid = member.guid

puts "\n************************** Read Member **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
puts member.guid

puts "\n************************** Update Member **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid

username_credential = {}
username_credential[:guid] = "CRD-9f61fb4c-912c-bd1e-b175-ccc7f0275cc1"
username_credential[:value] = "test_atrium"

password_credential = {}
password_credential[:guid] = "CRD-e3d7ea81-aac7-05e9-fbdd-4b493c6e474d"
password_credential[:value] = "challenge"

updated_credentials = []
updated_credentials.push(username_credential)
updated_credentials.push(password_credential)

member = member.update(:metadata => "{\"credentials_last_refreshed_at\": \"2015-10-16\"}", :credentials => updated_credentials)
puts member.guid

puts "\n************************** List Members **************************"
members = ::Atrium::Member.list :user_guid => user_guid
members.each do |a_member|
  puts a_member.guid
end

puts "\n************************** Aggregate Member **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
member = member.aggregate
puts member.guid

puts "\n************************** Read Member Status **************************"
sleep(5)
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
member = member.aggregation_status
puts member.guid

puts "\n************************** List Member MFA Challenges **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
challenges = member.challenges
challenges.each do |challenge|
  puts challenge.guid
end
challenge_guid = challenges[0].guid

puts "\n************************** Resume Aggregation **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid

credential_one = {}
credential_one[:guid] = challenge_guid
credential_one[:value] = "correct"

challenge_responses = []
challenge_responses.push(credential_one)

member = member.resume challenge_responses
puts member.status

puts "\n************************** List Member Credentials **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
credentials = member.credentials
credentials.each do |credential|
  puts credential.guid
end

puts "\n************************** List Member Accounts **************************"
sleep(5)
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
accounts = member.accounts
accounts.each do |account|
  puts account.guid
end
account_guid = accounts[0].guid

puts "\n************************** List Member Transactions **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
transactions = member.transactions
transactions.each do |transaction|
  puts transaction.guid
end

puts "\n************************** Read Account **************************"
account = ::Atrium::Account.read :user_guid => user_guid, :account_guid => account_guid
puts account.guid

puts "\n************************** List Accounts for User **************************"
user_guid = user_guid
params = { :user_guid => user_guid }
accounts = ::Atrium::Account.list params
accounts.each do |an_account|
  puts an_account.guid
end

puts "\n************************** List Account Transactions **************************"
account = ::Atrium::Account.read :user_guid => user_guid, :account_guid => account_guid

user_guid = user_guid
guid = account_guid
params = { :user_guid => user_guid, :guid => guid }

transactions = account.transactions params
transactions.each do |transaction|
  puts transaction.guid
end
transaction_guid = transactions[0].guid

puts "\n************************** Read a Transaction **************************"
transaction = ::Atrium::Transaction.read :user_guid => user_guid, :transaction_guid => transaction_guid
puts transaction.guid

puts "\n************************** List Transactions **************************"
user_guid = user_guid
account_guid = account_guid
params = { :user_guid => user_guid, :account_guid => account_guid }

transactions = ::Atrium::Transaction.list params
transactions.each do |a_transaction|
  puts a_transaction.guid
end

puts "\n************************** Connect Widget **************************"
widget = ::Atrium::Connect.create :user_guid => user_guid
puts widget.guid

puts "\n************************** Delete Member **************************"
member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
response = member.delete
puts response.attributes

puts "\n************************** Delete User **************************"
user = ::Atrium::User.read :guid => user_guid
response = user.delete
puts response.attributes
