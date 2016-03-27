class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.references :rate, index: true, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.string :company_name

      t.timestamps null: false
    end
  end
end
