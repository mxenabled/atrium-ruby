module Atrium
  class Member
    include ::ActiveAttr::Model
    include ::ActiveAttr::Attributes

    attribute :aggregated_at
    attribute :guid
    attribute :identifier
    attribute :institution_code
    attribute :metadata
    attribute :name
    attribute :status
    attribute :successfully_aggregated_at
    attribute :user_guid
    ##
    # POST /users/:user_guid/members
    #
    def self.create(params)
      endpoint = "/users/#{params[:user_guid]}/members"
      body = member_body(params)
      ::Atrium.client.make_request(:post, endpoint, body)
    end

    ##
    # GET /users/:user_guid/members/:member_guid/status
    #
    def self.status(user_guid, member_guid)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/status"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def self.member_body(params)
      {
        :member => {
          :credentials => params[:credentials],
          :identifier => params[:identifier],
          :institution_code => params[:institution_code],
          :metadata => params[:metadata]
        }
      }
    end
  end
end
