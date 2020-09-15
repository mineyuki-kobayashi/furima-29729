class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
     t.string :first_name, null: false
     t.string :last_name, null: false
     t.string :first_name_furigana, null: false
     t.string :last_name_furigana, null: false
     t.date :birthday, null: false
     t.string :email, null: false
     t.string :password, null: false
     t.string :nickname, null: false
    end
  end
end
