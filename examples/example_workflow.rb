#!/usr/bin/env ruby
require "atrium"

def check_job_status(user_guid, member_guid, counter)
  puts "\n2 second delay..."
  sleep(2)

  member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
  member_response = member.aggregation_status
  status = member_response.status

  puts "\nJOB STATUS: " + status
  case status
  when "COMPLETED"
    read_aggregation_data(user_guid, member_guid)
  when "HALTED", "FAILED"
    current_time = Time.now.utc.iso8601.chomp("Z") + "+00:00"

    member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
    last_success_time = member.aggregation_status

    # Check if last successful aggregation over 3 days aggregation
    if !last_success_time.nil? && ((current_time[8, 2] - last_success_time[8, 2]).abs > 3 || (current_time[5, 2] - last_success_time[5, 2]).abs > 0 || (current_time[0, 4] - last_success_time[0, 4]).abs > 0)
      puts "\nClient should contact MX Support to resolve issue."
    else
      puts "\nAn update is currently unavailable. Please try again tomorrow"
    end
  when "CREATED", "UPDATED", "RESUMED", "CONNECTED", "DEGRADED", "DELAYED", "INITIATED", "REQUESTED", "AUTHENTICATED", "RECEIVED", "TRANSFERRED"
    check_job_status(user_guid, member_guid, counter)
  when "PREVENTED", "DENIED", "IMPAIRED"
    member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
    institution_code = member.institution_code

    puts "\nPlease update credentials"
    credentials = ::Atrium::Institution.credentials institution_code
    updated_credentials = []
    credentials.each do |credential|
      puts "\nPlease enter in " + credential.label + ":"
      response = gets.chomp
      cred_pair = {}
      cred_pair[:guid] = credential.guid
      cred_pair[:value] = response
      updated_credentials.push(cred_pair)
    end

    member.update(:credentials => updated_credentials)

    check_job_status(user_guid, member_guid, counter)
  when "CHALLENGED"
    member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
    puts "\nPlease answer the following challenges:"
    challenges = member.challenges
    challenge_array = []
    challenges.each do |challenge|
      puts challenge.label
      answer = gets.chomp
      cred_pair = {}
      cred_pair[:guid] = challenge.guid
      cred_pair[:value] = answer
      challenge_array.push(cred_pair)
    end

    member.resume challenge_array

    check_job_status(user_guid, member_guid, counter)
  when "REJECTED"
    member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
    member.aggregate

    check_job_status(user_guid, member_guid, counter)
  when "EXPIRED"
    puts "\nUser did not answer MFA in time. Please try again tomorrow."
  when "LOCKED"
    puts "\nUser's account is locked at FI"
  when "IMPEDED"
    puts "\nUser's attention is required at FI website in order for aggregation to complete"
  when "DISCONTINUED"
    puts "\nConnection to institution is no longer available."
  when "CLOSED", "DISABLED"
    puts "\nAggregation is purposely turned off for this user."
  when "TERMINATED", "ABORTED", "STOPPED", "THROTTLED", "SUSPENDED", "ERRORED"
    if counter < 3
      counter += 1
      check_job_status(user_guid, member_guid, counter)
    else
      puts "\nAn update is currently unavailable. Please try again tomorrow and contact support if unsuccessful after 3 days."
    end
  else
    puts status
  end
end

def read_aggregation_data(user_guid, member_guid)
  member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid

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
end

::Atrium.configure do |config|
  config.mx_client_id = "YOUR_MX_CLIENT_ID"
  config.mx_api_key = "YOUR_MX_API_KEY"
end

counter = 0

puts "Please enter in user GUID. If not yet created just press enter key: "
user_guid = gets.chomp

puts "\nPlease enter in member GUID. If not yet created just press enter key: "
member_guid = gets.chomp

puts "\nPlease enter in if end user is present (true or false): "
end_user_present = gets.chomp

if user_guid == "" && member_guid != ""
  puts "\nMust include user GUID when member GUID is entered."
  exit
end

if user_guid == "" && end_user_present == "true"
  puts "\n* Creating user *"

  puts "\nPlease enter in an unique id: "
  identifier = gets.chomp

  user = ::Atrium::User.create :identifier => identifier, :is_disabled => nil, :metadata => nil
  user_guid = user.guid
  puts "\nCreated user: " + user_guid
end

if member_guid != "" && end_user_present == "true"
  member = ::Atrium::Member.read :user_guid => user_guid, :member_guid => member_guid
  member.aggregate
  check_job_status(user_guid, member_guid, counter)
elsif member_guid != ""
  read_aggregation_data(user_guid, member_guid)
elsif end_user_present == "true"
  puts "\n* Creating member *"

  institutions = ::Atrium::Institution.list
  institutions.each do |institution|
    puts institution.name + " : institution code = " + institution.code
  end

  puts "\nPlease enter in desired institution code: "
  institution_code = gets.chomp

  credentials = ::Atrium::Institution.credentials institution_code
  credential_array = []
  credentials.each do |credential|
    puts "\nPlease enter in " + credential.label + ":"
    response = gets.chomp
    cred_pair = {}
    cred_pair[:guid] = credential.guid
    cred_pair[:value] = response
    credential_array.push(cred_pair)
  end

  member = ::Atrium::Member.create :user_guid => user_guid, :institution_code => institution_code, :credentials => credential_array
  member_guid = member.guid
  puts "\nCreated member: " + member_guid

  check_job_status(user_guid, member_guid, counter)
else
  puts "\nEnd user must be present to create a new member"
  exit
end
