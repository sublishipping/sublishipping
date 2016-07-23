class AddLocaleToShop < ActiveRecord::Migration
  def change
    add_column(:shops, :locale, :string, default: 'en')
  end
end
