class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_many :rates
  has_many :filters, through: :rates

  def shipping_carrier_created?
    shipping_carrier_id.present? && !shipping_carrier_error?
  end

  def shipping_carrier_error?
    shipping_carrier_id == 0
  end

  def has_details?
    currency.present? && money_format.present?
  end
end
