class Filter < ActiveRecord::Base
  belongs_to :rate

  validate :validate_regexes

  def self.address_fields
    %w(address1 address2 city province country postal_code company_name)
  end

  def self.product_fields
    %w(sku)
  end

  def self.fields
    address_fields + product_fields
  end

  def regexes
    self.class.fields.map do |field|
      [field, read_attribute(field)]
    end.select do |(field, value)|
      value.present?
    end
  end

  private

  def validate_regexes
    regexes.each do |field, value|
      errors.add(field, :invalid) unless valid_regex?(value)
    end
  end

  def valid_regex?(regex)
    true # TODO fix
  end
end
