class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :maker
end
