class Shop::Keyword < ApplicationRecord
	belongs_to :key, polymorphic: true
end
