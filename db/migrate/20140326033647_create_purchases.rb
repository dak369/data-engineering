class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :dataset, index: true
      t.references :purchaser, index: true
      t.references :merchant, index: true
      t.references :item, index: true
      t.integer :count

      t.timestamps
    end
  end
end
