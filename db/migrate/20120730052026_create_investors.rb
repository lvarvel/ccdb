class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :tax_id

      t.timestamps
    end
    add_index :investors, :tax_id
  end
end
