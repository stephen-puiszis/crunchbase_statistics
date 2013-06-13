class RefactorDatabase < ActiveRecord::Migration
  def change

    remove_column :companies, :crunch_url
    remove_column :companies, :home_url
    remove_column :companies, :founded_date
    remove_column :companies, :dead_date
    remove_column :companies, :stock_symbol
    remove_column :companies, :created_at
    remove_column :companies, :updated_at


    remove_column :financials, :crunch_url
    remove_column :financials, :home_url
    remove_column :financials, :founded_date
    remove_column :financials,  :created_at
    remove_column :financials,  :updated_at

    remove_column :individuals, :crunch_url
    remove_column :individuals, :home_url
    remove_column :individuals, :created_at
    remove_column :individuals, :updated_at

    remove_column :fundings,  :created_at
    remove_column :fundings,  :updated_at

    # remove_column :investments, :created_at
    # remove_column :investments, :updated_at

    # remove_column :locations, :created_at
    # remove_column :locations, :updated_at

    # remove_column :industries, :created_at
    # remove_column :industries, :updated_at


  end
end
