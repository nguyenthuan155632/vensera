class Shop::Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true
end
