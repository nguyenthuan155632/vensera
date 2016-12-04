class Shop::Product < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images , as: :imageable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :keywords, as: :key, dependent: :destroy

  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :likes, :allow_destroy => true
  accepts_nested_attributes_for :keywords, :allow_destroy => true

  default_scope { where(active: true) }
end
