class Condition < ActiveRecord::Base
  FIELDS = %w(
    address1
    address2
    city
    province
    country
    postal_code
    company_name
    sku
  )

  belongs_to :rate

  validates :field, inclusion: FIELDS
  validates :verb, inclusion: Matcher::VERBS

  def valid_for?(input)
    Matcher.valid?(value: value, verb: verb, input: input)
  end
end
