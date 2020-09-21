class Item < ApplicationRecord
  #アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :postage, :schedule, :source, :status
  belong_to :user
  #バリデーション
  validates :user, :name, :explanation, :category, :postage, :schedule, :source, :status, presence: true
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :postage_id
    validates :schedule_id
    validates :source_id
    validates :status_id
  end
end
