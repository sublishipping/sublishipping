class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def search
    value = params.fetch('rate', {})
    addrs = value.fetch('destination')
    items = value.fetch('items', [])
    price = items.sum { |item| item['price'] || 0 }
    grams = items.sum { |item| item['grams'] || 0 }

    rates = shop.rates.includes(:filters, :conditions).select do |rate|
      next unless valid_price_for_rate?(rate, price)
      next unless valid_grams_for_rate?(rate, grams)

      if rate.conditions.any?
        rate.conditions.all? do |condition|
          if condition.field == 'sku'
            items.all? { |item| condition.valid_for?(item[condition.field]) }
          else
            condition.valid_for?(addrs[condition.field])
          end
        end
      else
        rate.filters.any? do |filter|
          filter.regexes.empty? || filter.regexes.all? do |field, regex|
            if Filter.address_fields.include?(field)
              addrs[field].present? && addrs[field].match(/#{regex}/i)
            elsif Filter.product_fields.include?(field)
              items.all? { |item| item[field].present? && item[field].match(/#{regex}/i) }
            end
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

  def valid_price_for_rate?(rate, price)
    if rate.min_price.present? && rate.max_price.present?
      price.between?(rate.min_price, rate.max_price)
    elsif rate.min_price.present?
      price >= rate.min_price
    elsif rate.max_price.present?
      price <= rate.max_price
    else
      true
    end
  end

  def valid_grams_for_rate?(rate, grams)
    if rate.min_grams.present? && rate.max_grams.present?
      grams.between?(rate.min_grams, rate.max_grams)
    elsif rate.min_grams.present?
      grams >= rate.min_grams
    elsif rate.max_grams.present?
      grams <= rate.max_grams
    else
      true
    end
  end

end
