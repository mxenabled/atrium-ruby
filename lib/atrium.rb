require "active_attr"
require "httpclient"
require "json"
require "atrium/pageable"
require "atrium/paginate"

require "atrium/account"
require "atrium/account_number"
require "atrium/account_owner"
require "atrium/client"
require "atrium/connect"
require "atrium/credential"
require "atrium/error"
require "atrium/institution"
require "atrium/challenge"
require "atrium/member"
require "atrium/transaction"
require "atrium/user"
require "atrium/version"

module Atrium
  ##
  # mx-api-key and mx-client-id are required for Atrium
  #
  # Atrium.configure do |config|
  #   config.mx_api_key = generated_api_key
  #   config.mx_client_id = generated_client_id
  #   config.base_url = "https://atrium.mx.com" # for production URL. this will default to vestibule
  # end
  #
  class << self
    attr_reader :client

    def configure
      @client = ::Atrium::Client.new
      yield @client
    end
  end
end
