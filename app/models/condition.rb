class Condition < ActiveRecord::Base
  FIELDS = %w(
    address1
    address2
    city
    province
    country
    postal_code
    company_name
    phone
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

  def valid?(field)
    return false if field.blank?

    case verb
    when 'regex'
      field.match(/#{value}/i)
    when 'include'
      field.include?(value)
    when 'exclude'
      field.exclude?(value)
    when 'equal'
      field == value
    when 'start_with'
      field.start_with?(value)
    when 'end_with'
      field.start_width?(value)
    end
  end
end
