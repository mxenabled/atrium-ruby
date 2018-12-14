=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'date'

module MX
  class Member
    attr_accessor :aggregated_at

    attr_accessor :connection_status

    attr_accessor :guid

    attr_accessor :identifier

    attr_accessor :institution_code

    attr_accessor :is_being_aggregated

    attr_accessor :metadata

    attr_accessor :name

    attr_accessor :status

    attr_accessor :successfully_aggregated_at

    attr_accessor :user_guid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'aggregated_at' => :'aggregated_at',
        :'connection_status' => :'connection_status',
        :'guid' => :'guid',
        :'identifier' => :'identifier',
        :'institution_code' => :'institution_code',
        :'is_being_aggregated' => :'is_being_aggregated',
        :'metadata' => :'metadata',
        :'name' => :'name',
        :'status' => :'status',
        :'successfully_aggregated_at' => :'successfully_aggregated_at',
        :'user_guid' => :'user_guid'
      }
    end

    # Attribute type mapping.
    def self.mx_types
      {
        :'aggregated_at' => :'String',
        :'connection_status' => :'String',
        :'guid' => :'BOOLEAN',
        :'identifier' => :'String',
        :'institution_code' => :'String',
        :'is_being_aggregated' => :'BOOLEAN',
        :'metadata' => :'String',
        :'name' => :'String',
        :'status' => :'String',
        :'successfully_aggregated_at' => :'String',
        :'user_guid' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'aggregated_at')
        self.aggregated_at = attributes[:'aggregated_at']
      end

      if attributes.has_key?(:'connection_status')
        self.connection_status = attributes[:'connection_status']
      end

      if attributes.has_key?(:'guid')
        self.guid = attributes[:'guid']
      end

      if attributes.has_key?(:'identifier')
        self.identifier = attributes[:'identifier']
      end

      if attributes.has_key?(:'institution_code')
        self.institution_code = attributes[:'institution_code']
      end

      if attributes.has_key?(:'is_being_aggregated')
        self.is_being_aggregated = attributes[:'is_being_aggregated']
      end

      if attributes.has_key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.has_key?(:'successfully_aggregated_at')
        self.successfully_aggregated_at = attributes[:'successfully_aggregated_at']
      end

      if attributes.has_key?(:'user_guid')
        self.user_guid = attributes[:'user_guid']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          aggregated_at == o.aggregated_at &&
          connection_status == o.connection_status &&
          guid == o.guid &&
          identifier == o.identifier &&
          institution_code == o.institution_code &&
          is_being_aggregated == o.is_being_aggregated &&
          metadata == o.metadata &&
          name == o.name &&
          status == o.status &&
          successfully_aggregated_at == o.successfully_aggregated_at &&
          user_guid == o.user_guid
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [aggregated_at, connection_status, guid, identifier, institution_code, is_being_aggregated, metadata, name, status, successfully_aggregated_at, user_guid].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.mx_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = MX.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
