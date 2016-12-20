require "atrium/client"
require "atrium/error"
require "atrium/institution"
require "atrium/member"
require "atrium/transaction"
require "atrium/user"
require "atrium/version"

require "httpclient"
require "json"

module Atrium
  BASE_URL = "https://vestibule.mx.com".freeze
  ##
  # mx-api-key and mx-client-id are required for Atrium
  #
  # Atrium.configure do |config|
  #   config.mx_api_key = generated_api_key
  #   config.mx_client_id = generated_client_id
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
