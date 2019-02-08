module Atrium
  class AtriumClient
    attr_accessor :accounts
    attr_accessor :connectWidget
    attr_accessor :holdings
    attr_accessor :identity
    attr_accessor :institutions
    attr_accessor :members
    attr_accessor :merchants
    attr_accessor :statements
    attr_accessor :transactions
    attr_accessor :users
    attr_accessor :verification

    def initialize(api_key, client_id)
      Atrium.configure do |config|
        config.api_key['MX-API-Key'] = api_key
        config.api_key['MX-Client-ID'] = client_id
      end
      
      @accounts = Atrium::AccountsApi.new()
      @connectWidget = Atrium::ConnectWidgetApi.new()
      @holdings = Atrium::HoldingsApi.new()
      @identity = Atrium::IdentityApi.new()
      @institutions = Atrium::InstitutionsApi.new()
      @members = Atrium::MembersApi.new()
      @merchants = Atrium::MerchantsApi.new()
      @statements = Atrium::StatementsApi.new()
      @transactions = Atrium::TransactionsApi.new()
      @users = Atrium::UsersApi.new()
      @verification = Atrium::VerificationApi.new()
    end
  end
end
