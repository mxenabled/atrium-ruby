=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'date'

module Atrium
  class TransactionCleanseAndCategorizeResponse
    attr_accessor :amount

    attr_accessor :category

    attr_accessor :description

    attr_accessor :identifier

    attr_accessor :type

    attr_accessor :is_bill_pay

    attr_accessor :is_direct_deposit

    attr_accessor :is_expense

    attr_accessor :is_fee

    attr_accessor :is_income

    attr_accessor :is_international

    attr_accessor :is_overdraft_fee

    attr_accessor :is_payroll_advance

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount' => :'amount',
        :'category' => :'category',
        :'description' => :'description',
        :'identifier' => :'identifier',
        :'type' => :'type',
        :'is_bill_pay' => :'is_bill_pay',
        :'is_direct_deposit' => :'is_direct_deposit',
        :'is_expense' => :'is_expense',
        :'is_fee' => :'is_fee',
        :'is_income' => :'is_income',
        :'is_international' => :'is_international',
        :'is_overdraft_fee' => :'is_overdraft_fee',
        :'is_payroll_advance' => :'is_payroll_advance'
      }
    end

    # Attribute type mapping.
    def self.mx_types
      {
        :'amount' => :'Float',
        :'category' => :'String',
        :'description' => :'String',
        :'identifier' => :'String',
        :'type' => :'String',
        :'is_bill_pay' => :'BOOLEAN',
        :'is_direct_deposit' => :'BOOLEAN',
        :'is_expense' => :'BOOLEAN',
        :'is_fee' => :'BOOLEAN',
        :'is_income' => :'BOOLEAN',
        :'is_international' => :'BOOLEAN',
        :'is_overdraft_fee' => :'BOOLEAN',
        :'is_payroll_advance' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'identifier')
        self.identifier = attributes[:'identifier']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'is_bill_pay')
        self.is_bill_pay = attributes[:'is_bill_pay']
      end

      if attributes.has_key?(:'is_direct_deposit')
        self.is_direct_deposit = attributes[:'is_direct_deposit']
      end

      if attributes.has_key?(:'is_expense')
        self.is_expense = attributes[:'is_expense']
      end

      if attributes.has_key?(:'is_fee')
        self.is_fee = attributes[:'is_fee']
      end

      if attributes.has_key?(:'is_income')
        self.is_income = attributes[:'is_income']
      end

      if attributes.has_key?(:'is_international')
        self.is_international = attributes[:'is_international']
      end

      if attributes.has_key?(:'is_overdraft_fee')
        self.is_overdraft_fee = attributes[:'is_overdraft_fee']
      end

      if attributes.has_key?(:'is_payroll_advance')
        self.is_payroll_advance = attributes[:'is_payroll_advance']
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
          amount == o.amount &&
          category == o.category &&
          description == o.description &&
          identifier == o.identifier &&
          type == o.type &&
          is_bill_pay == o.is_bill_pay &&
          is_direct_deposit == o.is_direct_deposit &&
          is_expense == o.is_expense &&
          is_fee == o.is_fee &&
          is_income == o.is_income &&
          is_international == o.is_international &&
          is_overdraft_fee == o.is_overdraft_fee &&
          is_payroll_advance == o.is_payroll_advance
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [amount, category, description, identifier, type, is_bill_pay, is_direct_deposit, is_expense, is_fee, is_income, is_international, is_overdraft_fee, is_payroll_advance].hash
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
