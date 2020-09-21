class Item < ApplicationRecord
  #アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belong_to :user
  #バリデーション
  validates :user, :name, :explanation, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
end
