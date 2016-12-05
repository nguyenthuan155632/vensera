class Shop::Product < ApplicationRecord
  belongs_to :category, :foreign_key => "shop_category_id"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images , as: :imageable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one :keyword, as: :key, dependent: :destroy

  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :likes, :allow_destroy => true
  accepts_nested_attributes_for :keyword, :allow_destroy => true

  # default_scope { where(active: "publish") }

  validates :product_name, presence: true
  validates :product_slug, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :thumbnail, presence: true
  validates :description, presence: true
  validates :detail, presence: true
  validates :active, presence: true
  validates :shop_category_id, presence: true
end
