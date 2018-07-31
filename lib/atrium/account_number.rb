module Atrium
  class AccountNumber
    include ::ActiveAttr::Model
    include ::ActiveAttr::Attributes

    attribute :guid
    attribute :user_guid
    attribute :member_guid
    attribute :account_guid
    attribute :account_number
    attribute :routing_number
  end
end
