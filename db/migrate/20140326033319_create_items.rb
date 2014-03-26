class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :dataset, index: true
      t.string :description
      t.decimal :price, precision: 11, scale: 2

      t.timestamps
    end
  end
end
