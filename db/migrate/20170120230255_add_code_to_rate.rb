class AddCodeToRate < ActiveRecord::Migration[5.0]
  def change
    add_column(:rates, :code, :string)
  end
end
