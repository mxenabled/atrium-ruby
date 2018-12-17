=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require "date"

module Atrium
  class MemberConnectionStatus
    attr_accessor :aggregated_at

    attr_accessor :challenges

    attr_accessor :connection_status

    attr_accessor :guid

    attr_accessor :has_processed_accounts

    attr_accessor :has_processed_transactions

    attr_accessor :is_being_aggregated

    attr_accessor :status

    attr_accessor :successfully_aggregated_at

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'aggregated_at' => :'aggregated_at',
        :'challenges' => :'challenges',
        :'connection_status' => :'connection_status',
        :'guid' => :'guid',
        :'has_processed_accounts' => :'has_processed_accounts',
        :'has_processed_transactions' => :'has_processed_transactions',
        :'is_being_aggregated' => :'is_being_aggregated',
        :'status' => :'status',
        :'successfully_aggregated_at' => :'successfully_aggregated_at'
      }
    end

    # Attribute type mapping.
    def self.mx_types
      {
        :'aggregated_at' => :'String',
        :'challenges' => :'Array<Challenge>',
        :'connection_status' => :'String',
        :'guid' => :'BOOLEAN',
        :'has_processed_accounts' => :'BOOLEAN',
        :'has_processed_transactions' => :'BOOLEAN',
        :'is_being_aggregated' => :'BOOLEAN',
        :'status' => :'String',
        :'successfully_aggregated_at' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'aggregated_at')
        self.aggregated_at = attributes[:'aggregated_at']
      end

      if attributes.key?(:'challenges')
        if (value = attributes[:'challenges']).is_a?(Array)
          self.challenges = value
        end
      end

      if attributes.key?(:'connection_status')
        self.connection_status = attributes[:'connection_status']
      end

      if attributes.key?(:'guid')
        self.guid = attributes[:'guid']
      end

      if attributes.key?(:'has_processed_accounts')
        self.has_processed_accounts = attributes[:'has_processed_accounts']
      end

      if attributes.key?(:'has_processed_transactions')
        self.has_processed_transactions = attributes[:'has_processed_transactions']
      end

      if attributes.key?(:'is_being_aggregated')
        self.is_being_aggregated = attributes[:'is_being_aggregated']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'successfully_aggregated_at')
        self.successfully_aggregated_at = attributes[:'successfully_aggregated_at']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = []
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
        aggregated_at == other.aggregated_at &&
        challenges == other.challenges &&
        connection_status == other.connection_status &&
        guid == other.guid &&
        has_processed_accounts == other.has_processed_accounts &&
        has_processed_transactions == other.has_processed_transactions &&
        is_being_aggregated == other.is_being_aggregated &&
        status == other.status &&
        successfully_aggregated_at == other.successfully_aggregated_at
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [aggregated_at, challenges, connection_status, guid, has_processed_accounts, has_processed_transactions, is_being_aggregated, status, successfully_aggregated_at].hash
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
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize(Regexp.last_match(1), v) })
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
        temp_model = Atrium.const_get(type).new
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
