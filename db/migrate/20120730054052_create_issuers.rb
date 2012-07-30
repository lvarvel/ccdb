class CreateIssuers < ActiveRecord::Migration
  def change
    create_table :issuers do |t|
      t.string :tax_id

      t.timestamps
    end
    add_index :issuers, :tax_id
  end
end
