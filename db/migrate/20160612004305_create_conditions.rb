class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.references :rate, index: true, foreign_key: true

      t.string :field, null: false
      t.string :verb, null: false
      t.text :value, null: false

      t.timestamps null: false
    end
  end
end
