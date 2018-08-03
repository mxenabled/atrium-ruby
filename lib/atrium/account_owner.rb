module Atrium
  class AccountOwner
    include ::ActiveAttr::Model
    include ::ActiveAttr::Attributes

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
  end
end
