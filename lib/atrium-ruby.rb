=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

# Common files
require 'atrium-ruby/api_client'
require 'atrium-ruby/api_error'
require 'atrium-ruby/version'
require 'atrium-ruby/configuration'

# Models
require 'atrium-ruby/models/account'
require 'atrium-ruby/models/account_attributes'
require 'atrium-ruby/models/account_number_attributes'
require 'atrium-ruby/models/account_numbers'
require 'atrium-ruby/models/account_owner_attributes'
require 'atrium-ruby/models/account_owners'
require 'atrium-ruby/models/accounts'
require 'atrium-ruby/models/challenge_attributes'
require 'atrium-ruby/models/challenge_attributes_options'
require 'atrium-ruby/models/challenges'
require 'atrium-ruby/models/connect_widget'
require 'atrium-ruby/models/connect_widget_attributes'
require 'atrium-ruby/models/connect_widget_request_body'
require 'atrium-ruby/models/credential_attributes'
require 'atrium-ruby/models/credential_option_attributes'
require 'atrium-ruby/models/credential_response_attributes'
require 'atrium-ruby/models/credentials'
require 'atrium-ruby/models/institution'
require 'atrium-ruby/models/institution_attributes'
require 'atrium-ruby/models/institutions'
require 'atrium-ruby/models/member'
require 'atrium-ruby/models/member_attributes'
require 'atrium-ruby/models/member_connection_status'
require 'atrium-ruby/models/member_connection_status_attributes'
require 'atrium-ruby/models/member_create_request_body'
require 'atrium-ruby/models/member_create_request_body_attributes'
require 'atrium-ruby/models/member_resume_request_body'
require 'atrium-ruby/models/member_resume_request_body_attributes'
require 'atrium-ruby/models/member_update_request_body'
require 'atrium-ruby/models/member_update_request_body_attributes'
require 'atrium-ruby/models/members'
require 'atrium-ruby/models/pagination'
require 'atrium-ruby/models/transaction'
require 'atrium-ruby/models/transaction_attributes'
require 'atrium-ruby/models/transactions'
require 'atrium-ruby/models/transactions_cleanse_and_categorize'
require 'atrium-ruby/models/transactions_cleanse_and_categorize_attributes'
require 'atrium-ruby/models/transactions_cleanse_and_categorize_request_body'
require 'atrium-ruby/models/transactions_cleanse_and_categorize_request_body_attributes'
require 'atrium-ruby/models/user'
require 'atrium-ruby/models/user_attributes'
require 'atrium-ruby/models/user_create_request_body'
require 'atrium-ruby/models/user_update_request_body'
require 'atrium-ruby/models/users'

# APIs
require 'atrium-ruby/api/accounts_api'
require 'atrium-ruby/api/connect_widget_api'
require 'atrium-ruby/api/identity_api'
require 'atrium-ruby/api/institutions_api'
require 'atrium-ruby/api/members_api'
require 'atrium-ruby/api/transactions_api'
require 'atrium-ruby/api/users_api'
require 'atrium-ruby/api/verification_api'

module MX
  class << self
    # Customize default settings for the SDK using block.
    #   MX.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
