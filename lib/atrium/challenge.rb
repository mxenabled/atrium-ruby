module Atrium
  class Challenge
    include ::ActiveAttr::Model
    include ::ActiveAttr::Attributes

    attribute :field_name
    attribute :guid
    attribute :label
    attribute :type
    attribute :image_data
    attribute :options
    attribute :member_guid

  end
end