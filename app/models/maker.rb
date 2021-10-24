class Maker < ApplicationRecord
  has_many :items
  has_many :genres, through: :maker_genres, dependent: :destroy
  has_many :maker_genres
  validates :name, presence: true
  validates :email, presence: true
  validates :telephone_number, presence: true
  validates :fax_number, presence: true

end
