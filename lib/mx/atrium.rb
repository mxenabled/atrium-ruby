require "active_attr"
require "httpclient"
require "json"

require "mx/atrium/paginate"

require "mx/atrium/account"
require "mx/atrium/client"
require "mx/atrium/credential"
require "mx/atrium/error"
require "mx/atrium/institution"
require "mx/atrium/member"
require "mx/atrium/transaction"
require "mx/atrium/user"
require "mx/atrium/version"

module MX
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
end
