class Rate < ActiveRecord::Base
  belongs_to :shop

  has_many :filters, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }
  validates :min_price, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :max_price, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :min_grams, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :max_grams, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true

  accepts_nested_attributes_for :filters

  def limits
    {
      min_price: min_price,
      max_price: max_price,
      min_grams: min_grams,
      max_grams: max_grams,
    }.select { |_, v| v }
  end

  def to_hash
    {
      service_name: name,
      service_code: name.underscore,
      total_price: price,
      currency: shop.currency
    }
  end
end
