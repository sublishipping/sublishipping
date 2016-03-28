class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_many :rates
  has_many :filters, through: :rates

  def shipping_carrier_created?
    shipping_carrier_id.present?
  end

  def has_details?
    currency.present? && money_format.present?
  end
end
