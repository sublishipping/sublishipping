class Condition < ActiveRecord::Base
  FIELDS = %w(
    address1
    address2
    city
    province
    country
    postal_code
    company_name
    sku
  )

  VERBS = %w(
    regex
    include
    exclude
    equal
    start_with
    end_with
  )

  belongs_to :rate

  validates :field, inclusion: FIELDS
  validates :verb, inclusion: VERBS

  def valid_for?(string)
    return false if string.nil?

    case verb
    when 'regex', 'include'
      string.match(/#{value}/i)
    when 'exclude'
      string !~ /#{value}/i
    when 'equal'
      string.match(/\A(#{value})\z/i)
    when 'start_with'
      string.match(/\A(#{value})/i)
    when 'end_with'
      string.match(/(#{value})\z/i)
    end
  end
end
