class CleanDatabaseSecondTime < ActiveRecord::Migration
  def change

    remove_column :locations, :created_at
    remove_column :locations, :updated_at

    remove_column :industries, :created_at
    remove_column :industries, :updated_at
  end
end
