class RatesController < ShopifyApp::AuthenticatedController
  def index
    @rates = shop.rates.includes(:filters).order(:name)

    if @rates.empty?
      render('blank')
    else
      render('index')
    end
  end

  def show
    @rate = shop.rates.find(params[:id])
  end

  def new
    @rate = shop.rates.build
  end

  def update
    rate = shop.rates.find(params[:id])

    if rate.update_attributes(rate_params)
      redirect_to(rates_path)
    else
      redirect_to(rate_path(rate))
    end
  end

  def destroy
    rate = shop.rates.find(params[:id])

    if rate.destroy
      redirect_to(rates_path)
    else
      redirect_to(rate_path(rate))
    end
  end

  def create
    @rate = shop.rates.build(rate_params)

    if @rate.save
      redirect_to(rates_path)
    else
      render('new')
    end
  end

  private

  def rate_params
    params.require(:rate).permit(
      :name,
      :price,
      :description,
      :min_price,
      :max_price,
      :min_grams,
      :max_grams,
      filters_attributes: filter_params,
      conditions_attributes: condition_params
    )
  end

  def filter_params
    Filter.fields + [:id]
  end

  def conditions_attributes
    Condition::FIELDS + [:id, :_destroy]
  end
end
