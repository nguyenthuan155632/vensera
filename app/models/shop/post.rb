class Shop::Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable
  has_many :images , as: :imageable
  has_many :likes, as: :likeable
  has_many :keywords, as: :key
end
