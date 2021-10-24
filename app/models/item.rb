class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :maker
  attachment :image
  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :user_price, presence: true
end
