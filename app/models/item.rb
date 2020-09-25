class Item < ApplicationRecord
  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :schedule
  belongs_to_active_hash :source
  belongs_to_active_hash :status
  belongs_to :user
  has_one :list
  has_one_attached :image
  # バリデーション
  with_options presence: true do
    validates :user
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category
    validates :postage
    validates :schedule
    validates :source
    validates :status
    validates :image
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :postage_id
    validates :schedule_id
    validates :source_id
    validates :status_id
  end
end
