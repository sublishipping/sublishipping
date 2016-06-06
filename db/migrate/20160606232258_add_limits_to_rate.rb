class AddLimitsToRate < ActiveRecord::Migration
  def change
    add_column(:rates, :min_grams, :integer)
    add_column(:rates, :max_grams, :integer)
    add_column(:rates, :min_price, :integer)
    add_column(:rates, :max_price, :integer)
  end
end
