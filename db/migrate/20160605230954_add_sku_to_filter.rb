class AddSkuToFilter < ActiveRecord::Migration
  def change
    add_column(:filters, :sku, :string)
  end
end
