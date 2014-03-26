class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.references :dataset, index: true
      t.string :name, index: true

      t.timestamps
    end
  end
end
