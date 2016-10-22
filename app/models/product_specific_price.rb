class ProductSpecificPrice < ActiveRecord::Base
  FIELDS = %w(
    name
    sku
    vendor
  )

  belongs_to :rate

  validates :field, inclusion: FIELDS
  validates :verb, inclusion: Matcher::VERBS
  validates :value, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }

  def valid_for?(item)
    Matcher.valid?(value: value, verb: verb, input: item[field])
  end
end
