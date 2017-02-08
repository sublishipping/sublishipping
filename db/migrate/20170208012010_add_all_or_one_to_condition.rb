class AddAllOrOneToCondition < ActiveRecord::Migration[5.0]
  def change
    add_column :conditions, :all_items_must_match, :boolean, default: true
  end
end
