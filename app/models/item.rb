class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :maker
  has_many :tags, dependent: :destroy
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
  
  # 消費税の計算
  def taxin_price
      (price * 1.1).round
  end
  
end
