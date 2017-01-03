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

    def accounts
      endpoint = "users/#{self.user_guid}/members/#{self.guid}/account"
      accounts_response = ::Atrium.client.make_request(:get, endpoint)

      account = accounts_response["accounts"].map do |account|
        ::Atrium::Account.new(account)
      end
    end

    def aggregate
      endpoint = "users/#{self.user_guid}/members/#{self.guid}/aggregate"
      member_response = ::Atrium.client.make_request(:post, endpoint)

      member_params = member_response["member"]
      self.assign_attributes(member_params)
      self
    end

    def self.create(params)
      endpoint = "/users/#{params[:user_guid]}/members"
      body = member_body(params)
      ::Atrium.client.make_request(:post, endpoint, body)
    end

    def delete(member_guid:, user_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      ::Atrium.client.make_request(:delete, endpoint)
    end

    def challenges(member_guid:, user_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/challenges"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def self.list(user_guid:)
      endpoint = "/users/#{user_guid}/members"
      members_response = ::Atrium.client.make_request(:get, endpoint)

      members = members_response["members"].map do |member|
        ::Atrium::Member.new(member)
      end
    end

    def self.read(user_guid:, member_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      member_response = ::Atrium.client.make_request(:get, endpoint)

      member_params = member_response["member"]
      ::Atrium::Member.new(member_params)
    end

    def update(member_guid:, user_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      ::Atrium.client.make_request(:put, endpoint)
    end

    def read_account(account_guid:)
      endpoint = "/users/#{self.user_guid}/members/#{self.guid}/accounts/#{account_guid}"
      account_response = ::Atrium.client.make_request(:get, endpoint)

      account_params = account_response["account"]
      ::Atrium::Account.new(account_params)
    end

    def resume
      # TODO: Pull in user_guid
      endpoint = "/users/#{user_guid}/members/#{member_guid}/resume"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # GET /users/:user_guid/members/member_guid:/status
    #
    def self.status(user_guid:, member_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/status"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def transactions
      endpoint = "users/#{self.user_guid}/members/#{self.guid}/transactions"
      transactions_response = ::Atrium.client.make_request(:post, endpoint)

      transactions = transactions_response["transactions"].map do |transaction|
        ::Atrium::Transaction.new(transaction)
      end
    end

    private

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
