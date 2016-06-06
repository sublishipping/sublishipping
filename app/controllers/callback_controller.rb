class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def search
    destination = params.fetch('rate', {}).fetch('destination')
    items = params.fetch('rate', {}).fetch('items', [])

    rates = shop.rates.includes(:filters).select do |rate|
      rate.filters.any? do |filter|
        filter.regexes.empty? || filter.regexes.all? do |field, regex|
          if Filter.address_fields.include?(field)
            destination[field].present? && destination[field].match(/#{regex}/i)
          elsif Filter.product_fields.include?(field)
            items.all? { |item| item[field].present? && item[field].match(/#{regex}/i) }
          end
        end
      end
    end

    render json: { rates: rates.map(&:to_hash) }
  rescue JSON::ParserError
    nil
  end

  private

  def shop
    @shop ||= Shop.find(params[:id])
  end

end
