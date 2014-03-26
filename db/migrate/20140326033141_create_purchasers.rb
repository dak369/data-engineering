class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.references :user, index: true
      t.string :name, index: true

      t.timestamps
    end
  end
end
