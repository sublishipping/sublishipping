class AddShopDetails < ActiveRecord::Migration
  def change
    add_column(:shops, :currency, :string)
    add_column(:shops, :money_format, :string)
  end
end
