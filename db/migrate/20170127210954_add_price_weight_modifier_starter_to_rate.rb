class AddPriceWeightModifierStarterToRate < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :price_weight_modifier_starter, :integer, null: false, default: 0
  end
end
