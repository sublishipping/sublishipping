class DropFilter < ActiveRecord::Migration
  def change
    drop_table :filters
  end
end
