class Purchase < ApplicationRecord
  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :source
  belongs_to :order
end
