namespace :parcelify do
  desc "Backfill filters to conditions"
  task filter_to_condition: :environment do
    Filter.find_in_batches do |filters|
      filters.each do |filter|
        Filter.fields.each do |field|
          value = filter.public_send(field)

          next if value.blank?

          condition = Condition.where(
            rate_id: filter.rate_id,
            field: field,
            verb: 'regex',
            value: value
          ).first_or_initialize

          unless condition.save
            Rails.logger.info("ERROR: #{condition.errors.full_messages}")
          end
        end
      end
    end
  end
end
