class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :issuer_id

      t.timestamps
    end
    add_index :deals, :issuer_id
  end
end
