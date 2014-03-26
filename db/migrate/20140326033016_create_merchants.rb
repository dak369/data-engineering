class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.references :user, index: true
      t.string :name, index: true
      t.string :address

      t.timestamps
    end
  end
end