class Shop::Category < ApplicationRecord
	has_many :products
	has_many :posts

	validates :category_name, presence: true
	validates :category_slug, presence: true, uniqueness: true
	validates :category_type, presence: true

end
