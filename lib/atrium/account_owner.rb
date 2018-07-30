module Atrium
  class AccountOwner
    extend ::Atrium::Pageable
    include ::ActiveAttr::Model

    attribute :guid
    attribute :user_guid
    attribute :member_guid
    attribute :account_guid
    attribute :owner_name
    attribute :address
    attribute :city
    attribute :state
    attribute :postal_code
    attribute :country
    attribute :email
    attribute :phone

    ##
    # CLASS METHODS
    #
    def self.list(options = {})
      options = _account_owner_pagination_options(options)
      paginate(options)
    end

    def self.list_each(options = {})
      options = _account_owner_pagination_options(options)
      paginate_each(options) { |member| yield member }
    end

    def self.list_in_batches(options = {})
      options = _account_owner_pagination_options(options)
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self._account_owner_pagination_options(options)
      user_guid = options.fetch(:user_guid)
      member_guid = options.fetch(:member_guid)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/account_owners"
      options.merge(:endpoint => endpoint, :resource => "account_owners")
    end
  end
end
