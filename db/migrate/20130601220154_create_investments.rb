class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :funding_id
      t.integer :investable_id
      t.string :investable_type

      t.timestamps
    end
  end
end
