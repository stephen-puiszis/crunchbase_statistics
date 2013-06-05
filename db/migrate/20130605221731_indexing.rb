class Indexing < ActiveRecord::Migration
  def change
    add_index :companies, :industry_id, :name => 'industry_id_ix'
    add_index :fundings, :company_id, :name => 'company_id_ix'
    add_index :locations, :company_id
    add_index :investments, :funding_id, :name => 'funding_id_ix'
    add_index :investments, [:investable_id, :investable_type]
  end
end
