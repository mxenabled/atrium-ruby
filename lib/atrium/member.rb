module Atrium
  class Member
    extend ::Atrium::Pageable
    include ::ActiveAttr::Model

    attribute :aggregated_at
    attribute :challenges
    attribute :guid
    attribute :has_processed_accounts
    attribute :has_processed_transactions
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

    def self.list(options = {})
      options = _member_pagination_options(options)
      paginate(options)
    end

    def self.list_each(options = {})
      options = _member_pagination_options(options)
      paginate_each(options) { |member| yield member }
    end

    def self.list_in_batches(options = {})
      options = _member_pagination_options(options)
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self.read(user_guid:, member_guid:)
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      member_response = ::Atrium.client.make_request(:get, endpoint)

      member_params = member_response["member"]
      ::Atrium::Member.new(member_params)
    end

    ##
    # INSTANCE METHODS
    #
    def accounts(options = {})
      options = _account_pagination_options(options)
      self.class.paginate(options)
    end

    def each_account(options = {})
      options = _account_pagination_options(options)
      self.class.paginate_each(options) { |account| yield account }
    end

    def accounts_in_batches(options = {})
      options = _account_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def aggregate
      endpoint = "/users/#{user_guid}/members/#{guid}/aggregate"
      member_response = ::Atrium.client.make_request(:post, endpoint)

      member_params = member_response["member"]
      assign_attributes(member_params)
      self
    end

    def aggregation_status
      endpoint = "/users/#{user_guid}/members/#{guid}/status"
      member_response = ::Atrium.client.make_request(:get, endpoint)

      member_params = member_response["member"]
      assign_attributes(member_params)
      self
    end

    def mfa_challenges
      endpoint = "/users/#{user_guid}/members/#{guid}/challenges"
      challenge_response = ::Atrium.client.make_request(:get, endpoint)

      return nil if challenge_response.nil?

      challenge_params = challenge_response["challenges"]

      challenge_params.map do |challenge|
        ::Atrium::Challenge.new(challenge)
      end
    end

    def delete
      endpoint = "/users/#{user_guid}/members/#{guid}"
      ::Atrium.client.make_request(:delete, endpoint)

      self
    end

    def read_account(account_guid:)
      endpoint = "/users/#{user_guid}/members/#{guid}/accounts/#{account_guid}"
      account_response = ::Atrium.client.make_request(:get, endpoint)

      account_params = account_response["account"]
      ::Atrium::Account.new(account_params)
    end

    def resume(challenge_credentials)
      endpoint = "/users/#{user_guid}/members/#{guid}/resume"
      body = resume_params(challenge_credentials)
      member_response = ::Atrium.client.make_request(:put, endpoint, body)

      member_params = member_response["member"]
      assign_attributes(member_params)
      self
    end

    def update(params)
      endpoint = "/users/#{user_guid}/members/#{guid}"
      body = member_body(params)
      member_response = ::Atrium.client.make_request(:put, endpoint, body)

      member_params = member_response["member"]
      assign_attributes(member_params)
      self
    end

    def credentials
      endpoint = "/users/#{user_guid}/members/#{guid}/credentials"
      credential_response = ::Atrium.client.make_request(:get, endpoint)

      return nil if credential_response.nil?

      credential_params = credential_response["credentials"]

      credential_params.map do |credential|
        ::Atrium::Credential.new(credential)
      end
    end

    def transactions(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate(options)
    end

    def each_transaction(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_each(options) { |transaction| yield transaction }
    end

    def transactions_in_batches(options = {})
      options = _transaction_pagination_options(options)
      self.class.paginate_in_batches(options) { |batch| yield batch }
    end

    def self._member_pagination_options(options)
      user_guid = options.fetch(:user_guid)
      endpoint = "/users/#{user_guid}/members"
      options.merge(:endpoint => endpoint, :resource => "members")
    end

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
    private_class_method :create_params

  private

    ##
    # PRIVATE INSTANCE METHODS
    #
    def _account_pagination_options(options)
      endpoint = "/users/#{user_guid}/members/#{guid}/accounts"
      options.merge(:endpoint => endpoint, :resource => "accounts", :klass => ::Atrium::Account)
    end

    def member_body(params)
      {
        :member => {
          :credentials => params[:credentials],
          :identifier => params[:identifier],
          :metadata => params[:metadata]
        }
      }
    end

    def resume_params(challenge_credentials)
      {
        :member => {
          :challenges => challenge_credentials
        }
      }
    end

    def _transaction_pagination_options(options)
      endpoint = "/users/#{user_guid}/members/#{guid}/transactions"
      options.merge(:endpoint => endpoint, :resource => "transactions", :klass => ::Atrium::Transaction)
    end
  end
end
