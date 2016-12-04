class Shop::Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable
  has_many :images , as: :imageable
  has_many :likes, as: :likeable
  has_many :keywords, as: :key

  validates :title, presence: true
	validates :slug, presence: true, uniqueness: true
	validates :thumbnail, presence: true
	validates :content, presence: true
	validates :active, presence: true
	validates :shop_category_id, presence: true
end
