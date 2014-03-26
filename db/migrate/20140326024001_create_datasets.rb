class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
