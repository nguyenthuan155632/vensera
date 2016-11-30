class Shop::Like < ApplicationRecord
	belongs_to :likeable, polymorphic: true
end
