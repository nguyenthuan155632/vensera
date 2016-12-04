class Shop::Product < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images , as: :imageable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :keywords, as: :key, dependent: :destroy

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :likes
  accepts_nested_attributes_for :keywords

  default_scope { where(active: true) }
end
