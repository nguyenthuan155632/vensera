class Shop::Product < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable
  has_many :images , as: :imageable
  has_many :like, as: :likeable
  has_many :keywords, as: :key

  default_scope { where(active: true) }
end
