module Atrium
  class Connect
    include ::ActiveAttr::Model

    SCRIPT_SOURCE = 'https://atrium.mx.com/connect.js'.freeze

    # ATTRIBUTES
    attribute :connect_widget_url
    attribute :guid

    ##
    # CLASS METHODS
    #
    def self.create(user_guid:)
      endpoint = "/users/#{user_guid}/connect_widget_url"
      connect_response = ::Atrium.client.make_request(:post, endpoint)

      connect_params = connect_response['user']
      ::Atrium::Connect.new(connect_params)
    end
  end
end
