# atrium-ruby

MX - the Ruby gem for the MX API

The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build atrium-ruby.gemspec
```

Then either install the gem locally:

```shell
gem install ./atrium-ruby-2.0.gem
```

Finally add this to the Gemfile:

    gem 'atrium-ruby', '~> 2.0'

### Install from Git

Add the following in the Gemfile:

    gem 'atrium-ruby', :git => 'https://github.com/mxenabled/atrium-ruby.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Example Usage

Please see `docs` directory for additional endpoint examples
```ruby
# Load the gem
require 'atrium-ruby'

# Setup authorization
MX.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['MX-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-API-Key'] = 'Bearer'

  # Configure API key authorization: clientID
  config.api_key['MX-Client-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-Client-ID'] = 'Bearer'
end

api_instance = MX::AccountsApi.new

account_guid = 'account_guid_example' # String | The unique identifier for an `account`.

user_guid = 'user_guid_example' # String | The unique identifier for a `user`.

opts = { 
  from_date: 'from_date_example', # String | Filter transactions from this date.
  to_date: 'to_date_example' # String | Filter transactions to this date.
  page: 12, # Integer | Specify current page.
  records_per_page: 12, # Integer | Specify records per page.
}

begin
  #List account transactions
  result = api_instance.list_account_transactions(account_guid, user_guid, opts)
  p result
rescue MX::ApiError => e
  puts "Exception when calling AccountsApi->list_account_transactions: #{e}"
end

```

## Documentation for API Endpoints

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*MX::AccountsApi* | [**list_account_transactions**](docs/AccountsApi.md#list_account_transactions) | **GET** /users/{user_guid}/accounts/{account_guid}/transactions | List account transactions
*MX::AccountsApi* | [**list_user_accounts**](docs/AccountsApi.md#list_user_accounts) | **GET** /users/{user_guid}/accounts | List accounts for a user
*MX::AccountsApi* | [**read_account**](docs/AccountsApi.md#read_account) | **GET** /users/{user_guid}/accounts/{account_guid} | Read an account
*MX::AccountsApi* | [**read_account_by_member_guid**](docs/AccountsApi.md#read_account_by_member_guid) | **GET** /users/{user_guid}/members/{member_guid}/accounts/{account_guid} | Read an account
*MX::ConnectWidgetApi* | [**get_connect_widget**](docs/ConnectWidgetApi.md#get_connect_widget) | **POST** /users/{user_guid}/connect_widget_url | Embedding in a website
*MX::IdentityApi* | [**identify_member**](docs/IdentityApi.md#identify_member) | **POST** /users/{user_guid}/members/{member_guid}/identify | Identify
*MX::IdentityApi* | [**list_account_owners**](docs/IdentityApi.md#list_account_owners) | **GET** /users/{user_guid}/members/{member_guid}/account_owners | List member account owners
*MX::InstitutionsApi* | [**list_institutions**](docs/InstitutionsApi.md#list_institutions) | **GET** /institutions | List institutions
*MX::InstitutionsApi* | [**read_institution**](docs/InstitutionsApi.md#read_institution) | **GET** /institutions/{institution_code} | Read institution
*MX::InstitutionsApi* | [**read_institution_credentials**](docs/InstitutionsApi.md#read_institution_credentials) | **GET** /institutions/{institution_code}/credentials | Read institution credentials
*MX::MembersApi* | [**aggregate_member**](docs/MembersApi.md#aggregate_member) | **POST** /users/{user_guid}/members/{member_guid}/aggregate | Aggregate member
*MX::MembersApi* | [**create_member**](docs/MembersApi.md#create_member) | **POST** /users/{user_guid}/members | Create member
*MX::MembersApi* | [**delete_member**](docs/MembersApi.md#delete_member) | **DELETE** /users/{user_guid}/members/{member_guid} | Delete member
*MX::MembersApi* | [**list_member_accounts**](docs/MembersApi.md#list_member_accounts) | **GET** /users/{user_guid}/members/{member_guid}/accounts | List member accounts
*MX::MembersApi* | [**list_member_credentials**](docs/MembersApi.md#list_member_credentials) | **GET** /users/{user_guid}/members/{member_guid}/credentials | List member credentials
*MX::MembersApi* | [**list_member_mfa_challenges**](docs/MembersApi.md#list_member_mfa_challenges) | **GET** /users/{user_guid}/members/{member_guid}/challenges | List member MFA challenges
*MX::MembersApi* | [**list_member_transactions**](docs/MembersApi.md#list_member_transactions) | **GET** /users/{user_guid}/members/{member_guid}/transactions | List member transactions
*MX::MembersApi* | [**list_members**](docs/MembersApi.md#list_members) | **GET** /users/{user_guid}/members | List members
*MX::MembersApi* | [**read_member**](docs/MembersApi.md#read_member) | **GET** /users/{user_guid}/members/{member_guid} | Read member
*MX::MembersApi* | [**read_member_status**](docs/MembersApi.md#read_member_status) | **GET** /users/{user_guid}/members/{member_guid}/status | Read member connection status
*MX::MembersApi* | [**resume_member**](docs/MembersApi.md#resume_member) | **PUT** /users/{user_guid}/members/{member_guid}/resume | Resume aggregation from MFA
*MX::MembersApi* | [**update_member**](docs/MembersApi.md#update_member) | **PUT** /users/{user_guid}/members/{member_guid} | Update member
*MX::TransactionsApi* | [**cleanse_and_categorize_transactions**](docs/TransactionsApi.md#cleanse_and_categorize_transactions) | **POST** /cleanse_and_categorize | Categorize transactions
*MX::TransactionsApi* | [**list_user_transactions**](docs/TransactionsApi.md#list_user_transactions) | **GET** /users/{user_guid}/transactions | List transactions for a user
*MX::TransactionsApi* | [**read_transaction**](docs/TransactionsApi.md#read_transaction) | **GET** /users/{user_guid}/transactions/{transaction_guid} | Read a transaction
*MX::UsersApi* | [**create_user**](docs/UsersApi.md#create_user) | **POST** /users | Create user
*MX::UsersApi* | [**delete_user**](docs/UsersApi.md#delete_user) | **DELETE** /users/{user_guid} | Delete user
*MX::UsersApi* | [**list_users**](docs/UsersApi.md#list_users) | **GET** /users | List users
*MX::UsersApi* | [**read_user**](docs/UsersApi.md#read_user) | **GET** /users/{user_guid} | Read user
*MX::UsersApi* | [**update_user**](docs/UsersApi.md#update_user) | **PUT** /users/{user_guid} | Update user
*MX::VerificationApi* | [**list_account_numbers**](docs/VerificationApi.md#list_account_numbers) | **GET** /users/{user_guid}/members/{member_guid}/account_numbers | Read account numbers
*MX::VerificationApi* | [**list_account_numbers_by_account**](docs/VerificationApi.md#list_account_numbers_by_account) | **GET** /users/{user_guid}/accounts/{account_guid}/account_numbers | Read account numbers by account GUID
*MX::VerificationApi* | [**verify_member**](docs/VerificationApi.md#verify_member) | **POST** /users/{user_guid}/members/{member_guid}/verify | Verify


## Documentation for Models

 - [MX::Account](docs/Account.md)
 - [MX::AccountAttributes](docs/AccountAttributes.md)
 - [MX::AccountNumberAttributes](docs/AccountNumberAttributes.md)
 - [MX::AccountNumbers](docs/AccountNumbers.md)
 - [MX::AccountOwnerAttributes](docs/AccountOwnerAttributes.md)
 - [MX::AccountOwners](docs/AccountOwners.md)
 - [MX::Accounts](docs/Accounts.md)
 - [MX::ChallengeAttributes](docs/ChallengeAttributes.md)
 - [MX::ChallengeOptionAttributes](docs/ChallengeOptionAttributes.md)
 - [MX::Challenges](docs/Challenges.md)
 - [MX::ConnectWidget](docs/ConnectWidget.md)
 - [MX::ConnectWidgetAttributes](docs/ConnectWidgetAttributes.md)
 - [MX::ConnectWidgetRequestBody](docs/ConnectWidgetRequestBody.md)
 - [MX::CredentialAttributes](docs/CredentialAttributes.md)
 - [MX::CredentialOptionAttributes](docs/CredentialOptionAttributes.md)
 - [MX::CredentialResponseAttributes](docs/CredentialResponseAttributes.md)
 - [MX::Credentials](docs/Credentials.md)
 - [MX::Institution](docs/Institution.md)
 - [MX::InstitutionAttributes](docs/InstitutionAttributes.md)
 - [MX::Institutions](docs/Institutions.md)
 - [MX::Member](docs/Member.md)
 - [MX::MemberAttributes](docs/MemberAttributes.md)
 - [MX::MemberConnectionStatus](docs/MemberConnectionStatus.md)
 - [MX::MemberConnectionStatusAttributes](docs/MemberConnectionStatusAttributes.md)
 - [MX::MemberCreateRequestBody](docs/MemberCreateRequestBody.md)
 - [MX::MemberCreateRequestBodyAttributes](docs/MemberCreateRequestBodyAttributes.md)
 - [MX::MemberResumeRequestBody](docs/MemberResumeRequestBody.md)
 - [MX::MemberResumeRequestBodyAttributes](docs/MemberResumeRequestBodyAttributes.md)
 - [MX::MemberUpdateRequestBody](docs/MemberUpdateRequestBody.md)
 - [MX::MemberUpdateRequestBodyAttributes](docs/MemberUpdateRequestBodyAttributes.md)
 - [MX::Members](docs/Members.md)
 - [MX::Pagination](docs/Pagination.md)
 - [MX::Transaction](docs/Transaction.md)
 - [MX::TransactionAttributes](docs/TransactionAttributes.md)
 - [MX::Transactions](docs/Transactions.md)
 - [MX::TransactionsCleanseAndCategorize](docs/TransactionsCleanseAndCategorize.md)
 - [MX::TransactionsCleanseAndCategorizeAttributes](docs/TransactionsCleanseAndCategorizeAttributes.md)
 - [MX::TransactionsCleanseAndCategorizeRequestBody](docs/TransactionsCleanseAndCategorizeRequestBody.md)
 - [MX::TransactionsCleanseAndCategorizeRequestBodyAttributes](docs/TransactionsCleanseAndCategorizeRequestBodyAttributes.md)
 - [MX::User](docs/User.md)
 - [MX::UserAttributes](docs/UserAttributes.md)
 - [MX::UserCreateRequestBody](docs/UserCreateRequestBody.md)
 - [MX::UserUpdateRequestBody](docs/UserUpdateRequestBody.md)
 - [MX::Users](docs/Users.md)

