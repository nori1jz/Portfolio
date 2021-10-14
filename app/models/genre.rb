class Genre < ApplicationRecord
  has_many :items
  has_many :makers, through: :maker_genres, dependent: :destroy
  # ↑maker_genresを通してメーカーをたくさん持っている
  has_many :maker_genres
  accepts_nested_attributes_for :maker_genres 
  # ↑ジャンルを保存するとmaker_genresも更新される

end
