class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops  do |t|
      t.string :shopify_domain, null: false
      t.string :shopify_token, null: false
      t.integer :shipping_carrier_id

      t.timestamps null: false
    end

    add_index :shops, :shopify_domain, unique: true
  end
end
