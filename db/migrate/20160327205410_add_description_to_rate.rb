class AddDescriptionToRate < ActiveRecord::Migration
  def change
    add_column(:rates, :description, :text)
  end
end
