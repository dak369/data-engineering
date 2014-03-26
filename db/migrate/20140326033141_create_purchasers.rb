class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.references :dataset, index: true
      t.string :name
      t.index :name

      t.timestamps
    end
  end
end
