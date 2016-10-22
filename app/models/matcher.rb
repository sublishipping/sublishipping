class Matcher
  VERBS = %w(
    regex
    include
    exclude
    equal
    start_with
    end_with
  )

  def self.valid?(verb:, value:, input:)
    return false if input.nil?

    case verb
    when 'regex', 'include'
      input.match(/#{value}/i)
    when 'exclude'
      input !~ /#{value}/i
    when 'equal'
      input.match(/\A(#{value})\z/i)
    when 'start_with'
      input.match(/\A(#{value})/i)
    when 'end_with'
      input.match(/(#{value})\z/i)
    end
  end
end
