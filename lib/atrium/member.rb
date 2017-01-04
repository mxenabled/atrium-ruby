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
    # CLASS METHODS
    #
    def self.create(user_guid:, institution_code:, credentials:)
      endpoint = "/users/#{user_guid}/members"
      body = create_params(institution_code, credentials)
      member_response = ::Atrium.client.make_request(:post, endpoint, body)

      member_params = member_response["member"]
      ::Atrium::Member.new(member_params)
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

    def self.status(user_guid:, member_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/status"
      ::Atrium.client.make_request(:get, endpoint)
    end

    ##
    # INSTANCE METHODS
    #
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

    def challenges(member_guid:, user_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/challenges"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def delete
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      ::Atrium.client.make_request(:delete, endpoint)
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

    def update(params)
      endpoint = "/users/#{self.user_guid}/members/#{self.member_guid}"
      body = member_body(params)
      member_response = ::Atrium.client.make_request(:put, endpoint, body)

      member_params = member_response["member"]
      self.assign_attributes(member_params)
      self
    end

    def transactions
      endpoint = "users/#{self.user_guid}/members/#{self.guid}/transactions"
      transactions_response = ::Atrium.client.make_request(:post, endpoint)

      transactions = transactions_response["transactions"].map do |transaction|
        ::Atrium::Transaction.new(transaction)
      end
    end

    private
    ##
    # PRIVATE CLASS METHODS
    #
    def self.create_params(institution_code, credentials_array)
      {
        :member => {
          :institution_code => institution_code,
          :credentials => credentials_array
        }
      }
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

    ##
    # PRIVATE INSTANCE METHODS
    #
    def member_body(params)
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
