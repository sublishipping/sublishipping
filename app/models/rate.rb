class Rate < ActiveRecord::Base
  belongs_to :shop

  has_many :conditions, dependent: :destroy
  has_many :product_specific_prices, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }
  validates :price_weight_modifier, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }
  validates :min_price, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :max_price, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :min_grams, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true
  validates :max_grams, numericality: { greater_than_or_equal_to: 0, less_than: 10_000_000 }, allow_nil: true

  accepts_nested_attributes_for :conditions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :product_specific_prices, allow_destroy: true, reject_if: :all_blank

  attr_accessor :grams, :items

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
      total_price: calculate_price,
      currency: shop.currency,
      description: description,
    }
  end

  def calculate_price
    total_price = price + (grams * price_weight_modifier)

    product_specific_prices.each do |product_specific_price|
      items.each do |item|
        if product_specific_price.valid_for?(item)
          total_price += product_specific_price.price * item['quantity']
        end
      end
    end

    total_price
  end
end
