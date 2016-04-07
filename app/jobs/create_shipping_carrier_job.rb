class CreateShippingCarrierJob < ApplicationJob
  def perform(shop_domain:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    ShopifyAPI::CarrierService.find(:all).each do |carrier_service|
      carrier_service.destroy
    end

    carrier_service = ShopifyAPI::CarrierService.create(
      name: "Parcelify",
      callback_url: "#{Rails.configuration.application_url}/callback/#{shop.id}.json",
      format: "json",
      service_discovery: true
    )

    shop.update_attribute(:shipping_carrier_id, carrier_service.id)
  ensure
    unless shop.shipping_carrier_created?
      shop.update_attribute(:shipping_carrier_id, 0)
    end
  end
end
