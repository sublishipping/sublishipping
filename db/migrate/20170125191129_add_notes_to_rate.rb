class AddNotesToRate < ActiveRecord::Migration[5.0]
  def change
    add_column(:rates, :notes, :text)
  end
end
