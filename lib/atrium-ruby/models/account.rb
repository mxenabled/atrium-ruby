=begin
#MX API

#The MX Atrium API supports over 48,000 data connections to thousands of financial institutions. It provides secure access to your users' accounts and transactions with industry-leading cleansing, categorization, and classification.  Atrium is designed according to resource-oriented REST architecture and responds with JSON bodies and HTTP response codes.  Use Atrium's development environment, vestibule.mx.com, to quickly get up and running. The development environment limits are 100 users, 25 members per user, and access to the top 15 institutions. Contact MX to purchase production access. 


=end

require 'date'

module Atrium
  class Account
    attr_accessor :account_number

    attr_accessor :apr

    attr_accessor :apy

    attr_accessor :available_balance

    attr_accessor :available_credit

    attr_accessor :balance

    attr_accessor :cash_balance

    attr_accessor :cash_surrender_value

    attr_accessor :created_at

    attr_accessor :credit_limit

    attr_accessor :currency_code

    attr_accessor :day_payment_is_due

    attr_accessor :death_benefit

    attr_accessor :guid

    attr_accessor :holdings_value

    attr_accessor :insured_name

    attr_accessor :institution_code

    attr_accessor :interest_rate

    attr_accessor :is_closed

    attr_accessor :last_payment

    attr_accessor :loan_amount

    attr_accessor :matures_on

    attr_accessor :member_guid

    attr_accessor :minimum_balance

    attr_accessor :minimum_payment

    attr_accessor :name

    attr_accessor :original_balance

    attr_accessor :payment_due_at

    attr_accessor :payoff_balance

    attr_accessor :pay_out_amount

    attr_accessor :premium_amount

    attr_accessor :started_on

    attr_accessor :subtype

    attr_accessor :total_account_value

    attr_accessor :type

    attr_accessor :updated_at

    attr_accessor :user_guid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_number' => :'account_number',
        :'apr' => :'apr',
        :'apy' => :'apy',
        :'available_balance' => :'available_balance',
        :'available_credit' => :'available_credit',
        :'balance' => :'balance',
        :'cash_balance' => :'cash_balance',
        :'cash_surrender_value' => :'cash_surrender_value',
        :'created_at' => :'created_at',
        :'credit_limit' => :'credit_limit',
        :'currency_code' => :'currency_code',
        :'day_payment_is_due' => :'day_payment_is_due',
        :'death_benefit' => :'death_benefit',
        :'guid' => :'guid',
        :'holdings_value' => :'holdings_value',
        :'insured_name' => :'insured_name',
        :'institution_code' => :'institution_code',
        :'interest_rate' => :'interest_rate',
        :'is_closed' => :'is_closed',
        :'last_payment' => :'last_payment',
        :'loan_amount' => :'loan_amount',
        :'matures_on' => :'matures_on',
        :'member_guid' => :'member_guid',
        :'minimum_balance' => :'minimum_balance',
        :'minimum_payment' => :'minimum_payment',
        :'name' => :'name',
        :'original_balance' => :'original_balance',
        :'payment_due_at' => :'payment_due_at',
        :'payoff_balance' => :'payoff_balance',
        :'pay_out_amount' => :'pay_out_amount',
        :'premium_amount' => :'premium_amount',
        :'started_on' => :'started_on',
        :'subtype' => :'subtype',
        :'total_account_value' => :'total_account_value',
        :'type' => :'type',
        :'updated_at' => :'updated_at',
        :'user_guid' => :'user_guid'
      }
    end

    # Attribute type mapping.
    def self.mx_types
      {
        :'account_number' => :'String',
        :'apr' => :'Float',
        :'apy' => :'Float',
        :'available_balance' => :'Float',
        :'available_credit' => :'Float',
        :'balance' => :'Float',
        :'cash_balance' => :'Float',
        :'cash_surrender_value' => :'Float',
        :'created_at' => :'String',
        :'credit_limit' => :'Float',
        :'currency_code' => :'String',
        :'day_payment_is_due' => :'Integer',
        :'death_benefit' => :'Float',
        :'guid' => :'String',
        :'holdings_value' => :'Float',
        :'insured_name' => :'String',
        :'institution_code' => :'String',
        :'interest_rate' => :'Float',
        :'is_closed' => :'BOOLEAN',
        :'last_payment' => :'Float',
        :'loan_amount' => :'Float',
        :'matures_on' => :'String',
        :'member_guid' => :'String',
        :'minimum_balance' => :'Float',
        :'minimum_payment' => :'Float',
        :'name' => :'String',
        :'original_balance' => :'Float',
        :'payment_due_at' => :'String',
        :'payoff_balance' => :'Float',
        :'pay_out_amount' => :'Float',
        :'premium_amount' => :'Float',
        :'started_on' => :'String',
        :'subtype' => :'String',
        :'total_account_value' => :'Float',
        :'type' => :'String',
        :'updated_at' => :'String',
        :'user_guid' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'account_number')
        self.account_number = attributes[:'account_number']
      end

      if attributes.has_key?(:'apr')
        self.apr = attributes[:'apr']
      end

      if attributes.has_key?(:'apy')
        self.apy = attributes[:'apy']
      end

      if attributes.has_key?(:'available_balance')
        self.available_balance = attributes[:'available_balance']
      end

      if attributes.has_key?(:'available_credit')
        self.available_credit = attributes[:'available_credit']
      end

      if attributes.has_key?(:'balance')
        self.balance = attributes[:'balance']
      end

      if attributes.has_key?(:'cash_balance')
        self.cash_balance = attributes[:'cash_balance']
      end

      if attributes.has_key?(:'cash_surrender_value')
        self.cash_surrender_value = attributes[:'cash_surrender_value']
      end

      if attributes.has_key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.has_key?(:'credit_limit')
        self.credit_limit = attributes[:'credit_limit']
      end

      if attributes.has_key?(:'currency_code')
        self.currency_code = attributes[:'currency_code']
      end

      if attributes.has_key?(:'day_payment_is_due')
        self.day_payment_is_due = attributes[:'day_payment_is_due']
      end

      if attributes.has_key?(:'death_benefit')
        self.death_benefit = attributes[:'death_benefit']
      end

      if attributes.has_key?(:'guid')
        self.guid = attributes[:'guid']
      end

      if attributes.has_key?(:'holdings_value')
        self.holdings_value = attributes[:'holdings_value']
      end

      if attributes.has_key?(:'insured_name')
        self.insured_name = attributes[:'insured_name']
      end

      if attributes.has_key?(:'institution_code')
        self.institution_code = attributes[:'institution_code']
      end

      if attributes.has_key?(:'interest_rate')
        self.interest_rate = attributes[:'interest_rate']
      end

      if attributes.has_key?(:'is_closed')
        self.is_closed = attributes[:'is_closed']
      end

      if attributes.has_key?(:'last_payment')
        self.last_payment = attributes[:'last_payment']
      end

      if attributes.has_key?(:'loan_amount')
        self.loan_amount = attributes[:'loan_amount']
      end

      if attributes.has_key?(:'matures_on')
        self.matures_on = attributes[:'matures_on']
      end

      if attributes.has_key?(:'member_guid')
        self.member_guid = attributes[:'member_guid']
      end

      if attributes.has_key?(:'minimum_balance')
        self.minimum_balance = attributes[:'minimum_balance']
      end

      if attributes.has_key?(:'minimum_payment')
        self.minimum_payment = attributes[:'minimum_payment']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'original_balance')
        self.original_balance = attributes[:'original_balance']
      end

      if attributes.has_key?(:'payment_due_at')
        self.payment_due_at = attributes[:'payment_due_at']
      end

      if attributes.has_key?(:'payoff_balance')
        self.payoff_balance = attributes[:'payoff_balance']
      end

      if attributes.has_key?(:'pay_out_amount')
        self.pay_out_amount = attributes[:'pay_out_amount']
      end

      if attributes.has_key?(:'premium_amount')
        self.premium_amount = attributes[:'premium_amount']
      end

      if attributes.has_key?(:'started_on')
        self.started_on = attributes[:'started_on']
      end

      if attributes.has_key?(:'subtype')
        self.subtype = attributes[:'subtype']
      end

      if attributes.has_key?(:'total_account_value')
        self.total_account_value = attributes[:'total_account_value']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
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
          account_number == o.account_number &&
          apr == o.apr &&
          apy == o.apy &&
          available_balance == o.available_balance &&
          available_credit == o.available_credit &&
          balance == o.balance &&
          cash_balance == o.cash_balance &&
          cash_surrender_value == o.cash_surrender_value &&
          created_at == o.created_at &&
          credit_limit == o.credit_limit &&
          currency_code == o.currency_code &&
          day_payment_is_due == o.day_payment_is_due &&
          death_benefit == o.death_benefit &&
          guid == o.guid &&
          holdings_value == o.holdings_value &&
          insured_name == o.insured_name &&
          institution_code == o.institution_code &&
          interest_rate == o.interest_rate &&
          is_closed == o.is_closed &&
          last_payment == o.last_payment &&
          loan_amount == o.loan_amount &&
          matures_on == o.matures_on &&
          member_guid == o.member_guid &&
          minimum_balance == o.minimum_balance &&
          minimum_payment == o.minimum_payment &&
          name == o.name &&
          original_balance == o.original_balance &&
          payment_due_at == o.payment_due_at &&
          payoff_balance == o.payoff_balance &&
          pay_out_amount == o.pay_out_amount &&
          premium_amount == o.premium_amount &&
          started_on == o.started_on &&
          subtype == o.subtype &&
          total_account_value == o.total_account_value &&
          type == o.type &&
          updated_at == o.updated_at &&
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
      [account_number, apr, apy, available_balance, available_credit, balance, cash_balance, cash_surrender_value, created_at, credit_limit, currency_code, day_payment_is_due, death_benefit, guid, holdings_value, insured_name, institution_code, interest_rate, is_closed, last_payment, loan_amount, matures_on, member_guid, minimum_balance, minimum_payment, name, original_balance, payment_due_at, payoff_balance, pay_out_amount, premium_amount, started_on, subtype, total_account_value, type, updated_at, user_guid].hash
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
