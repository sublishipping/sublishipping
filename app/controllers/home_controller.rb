class HomeController < ShopifyApp::AuthenticatedController
  before_filter :ensure_shipping_carrier_created

  def index
    redirect_to(rates_path)
  end

  private

  def ensure_shipping_carrier_created
    return if shop.shipping_carrier_created?
    CreateShippingCarrierJob.perform_later(shop)
    render 'onboarding'
  end
end
