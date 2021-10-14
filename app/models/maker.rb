class Maker < ApplicationRecord
  has_many :items
  has_many :genres, through: :maker_genres, dependent: :destroy
  has_many :maker_genres
end
