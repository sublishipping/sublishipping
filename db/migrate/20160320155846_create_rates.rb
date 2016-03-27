class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
