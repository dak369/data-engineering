class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.references :dataset, index: true
      t.string :name
      t.index :name
      t.string :address

      t.timestamps
    end
  end
end
