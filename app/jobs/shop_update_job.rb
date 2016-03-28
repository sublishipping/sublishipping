class ShopUpdateJob < ApplicationJob
  def perform(shop_domain:, webhook: nil)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      shopify_shop = ShopifyAPI::Shop.current

      shop.assign_attributes(
        currency: shopify_shop.currency,
        money_format: shopify_shop.money_in_emails_format,
      )

      shop.save!
    end
  end
end
