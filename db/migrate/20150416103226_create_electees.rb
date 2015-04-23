class CreateElectees < ActiveRecord::Migration
  def change
    create_table :electees do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :electees, :users
  end
end
