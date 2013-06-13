class DropIndustriesTable < ActiveRecord::Migration
  def change
    drop_table :industries
  end
end
