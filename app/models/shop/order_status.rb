class Shop::OrderStatus < ApplicationRecord
	has_many :orders
end
