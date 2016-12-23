class Shop::CategorySerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_slug, :category_type
end
