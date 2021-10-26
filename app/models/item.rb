class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :maker
  has_many :favorites, dependent: :destroy
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  has_many :favorited_customers, through: :favorites, source: :customer
  attachment :image
  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :user_price, presence: true
end
