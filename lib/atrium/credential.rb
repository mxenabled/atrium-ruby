module Atrium
  class Credential
    include ::ActiveAttr::Model

    attribute :field_name
    attribute :guid
    attribute :label
    attribute :type
    attribute :value
  end
end
