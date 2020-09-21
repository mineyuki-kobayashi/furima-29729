class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :postage_id, null: false
      t.integer :source_id, null: false
      t.integer :schedule_id, null: false
      t.integer :price, null: false
    end
  end
end