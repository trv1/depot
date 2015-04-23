class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price
      t.references :product, index: true
      t.references :electee, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :products
    add_foreign_key :items, :electees
  end
end
