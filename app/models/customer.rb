class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  has_many :favorites, dependent: :destroy
  has_many :favored_items, through: :favorites, source: :item
  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end
  validates :email, presence: true
  validates :company, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

end
