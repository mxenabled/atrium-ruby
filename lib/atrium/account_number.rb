module Atrium
  class AccountNumber
    extend ::Atrium::Pageable
    include ::ActiveAttr::Model

    attribute :guid
    attribute :user_guid
    attribute :member_guid
    attribute :account_guid
    attribute :account_number
    attribute :routing_number

    ##
    # CLASS METHODS
    #
    def self.list(options = {})
      options = _account_number_pagination_options(options)
      paginate(options)
    end

    def self.list_each(options = {})
      options = _account_number_pagination_options(options)
      paginate_each(options) { |member| yield member }
    end

    def self.list_in_batches(options = {})
      options = _account_number_pagination_options(options)
      paginate_in_batches(options) { |batch| yield batch }
    end

    def self._account_number_pagination_options(options)
      user_guid = options.fetch(:user_guid)
      member_guid = options.fetch(:member_guid)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/account_numbers"
      options.merge(:endpoint => endpoint, :resource => "account_numbers")
    end
  end
end
