class AddPriceWeightModifierToRate < ActiveRecord::Migration
  def change
    add_column :rates, :price_weight_modifier, :float, null: false, default: 0
  end
end
