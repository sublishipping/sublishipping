class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def search
    destination = params.fetch('rate', {}).fetch('destination')

    rates = shop.rates.select do |rate|
      rate.filters.any? do |filter|
        filter.regexes.empty? || filter.regexes.all? do |field, regex|
          destination[field].present? && destination[field].match(/#{regex}/i)
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
