require "set"

module Atrium
  class Connect
    include ::ActiveAttr::Model

    PERMITTED_CONNECT_CREATE_OPTIONS = ::Set.new([
                                                   "current_institution_code",
                                                   "current_member_guid",
                                                   "is_mobile_webview",
                                                   "update_credentials",
                                                 ]).freeze
    SCRIPT_SOURCE = "https://atrium.mx.com/connect.js".freeze

    # ATTRIBUTES
    attribute :connect_widget_url
    attribute :guid

    ##
    # CLASS METHODS
    #
    def self.create(user_guid:, options: {})
      options.each do |key, _value|
        fail ArgumentError, "An invalid option was provided: #{key}" unless PERMITTED_CONNECT_CREATE_OPTIONS.include?(key.to_s)
      end

      endpoint = "/users/#{user_guid}/connect_widget_url"
      connect_response = ::Atrium.client.make_request(:post, endpoint, options)

      connect_params = connect_response["user"]
      ::Atrium::Connect.new(connect_params)
    end
  end
end
