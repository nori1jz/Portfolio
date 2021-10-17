class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :maker
  attachment :image 
end
