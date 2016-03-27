class ConvertFilterStringsToTexts < ActiveRecord::Migration
  def up
    change_column(:filters, :address1, :text)
    change_column(:filters, :address2, :text)
    change_column(:filters, :city, :text)
    change_column(:filters, :province, :text)
    change_column(:filters, :country, :text)
    change_column(:filters, :postal_code, :text)
    change_column(:filters, :company_name, :text)
  end

  def down
    change_column(:filters, :address1, :string)
    change_column(:filters, :address2, :string)
    change_column(:filters, :city, :string)
    change_column(:filters, :province, :string)
    change_column(:filters, :country, :string)
    change_column(:filters, :postal_code, :string)
    change_column(:filters, :company_name, :string)
  end
end
