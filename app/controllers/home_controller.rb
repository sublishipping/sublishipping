class HomeController < ShopifyApp::AuthenticatedController
  before_filter :ensure_shop_onboarded

  def index
    redirect_to(rates_path)
  end

  private

  def ensure_shop_onboarded
    ensure_shipping_carrier_created
    ensure_shop_updated
    handle_onboarding_if_required
  end

  def ensure_shipping_carrier_created
    return if shop.shipping_carrier_created?
    CreateShippingCarrierJob.perform_later(shop_domain: shop.shopify_domain)
    onboarding!
  end

  def ensure_shop_updated
    return if shop.has_details?
    ShopUpdateJob.perform_later(shop_domain: shop.shopify_domain)
    onboarding!
  end

  def handle_onboarding_if_required
    return unless onboarding?
    render('onboarding')
  end

  def onboarding!
    @onboarding = true
  end

  def onboarding?
    @onboarding
  end
end
