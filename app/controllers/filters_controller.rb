class FiltersController < ShopifyApp::AuthenticatedController
  def new
    @filter = rate.filters.build
  end

  def create
    @filter = rate.filters.build(filter_params)

    if @filter.save
      redirect_to(rate)
    else
      render('new')
    end
  end

  private

  def rate
    @rate ||= shop.rates.find(params[:rate_id])
  end
  helper_method :rate

  def filter_params
    params.require(:filter).permit(Filter.fields)
  end
end
