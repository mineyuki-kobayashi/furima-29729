class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :list, null: false, foreign_key: true
      t.string :postal, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone, null: false
      t.timestamps
    end
  end
end
