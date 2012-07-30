class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :investor_id
      t.integer :deal_id

      t.timestamps
    end
    add_index :investments, :investor_id
    add_index :investments, :deal_id
  end
end
