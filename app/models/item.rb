class Item < ApplicationRecord
  #アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :schedule
  belongs_to_active_hash :source
  belongs_to_active_hash :status
  belongs_to :user
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
