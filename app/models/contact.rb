class Contact < ApplicationRecord
  belongs_to :customer
  validates :message, presence: true
  validates :name, presence: true
end
