# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop::Category.delete_all
20.times do 
	category_name = Faker::Name.name
	Shop::Category.create(category_name: category_name, category_slug: Faker::Internet.slug(category_name, '-'), category_type: ["post", "product"].sample)
end

Shop::Post.delete_all
20.times do
	title = Faker::Lorem.sentence
	Shop::Post.create(title: title, slug: Faker::Internet.slug(title, '-'), thumbnail: ["anh-bia-facebook-6.jpg", "slide-mushroom2.jpg", "blue-money-icon-pz-icon34.jpg", "Coin_-_Bitcoin-512.png", "jpy.png", "1479910907_2.png", "1480323779_usd.png", "Hundred-dollar-bill.jpg"].sample, content: Faker::Lorem.paragraph, active: "publish", description: Faker::Lorem.paragraphs(1), shop_category_id: Shop::Category.select(:id).where(category_type: "post").to_a.sample[:id])
end

Shop::Product.delete_all
20.times do
	product_name = Faker::Lorem.sentence
	Shop::Product.create(product_name: product_name, product_slug: Faker::Internet.slug(product_name, '-'), price: Faker::Number.number(6), quantity: Faker::Number.number(2), thumbnail: ["anh-bia-facebook-6.jpg", "slide-mushroom2.jpg", "blue-money-icon-pz-icon34.jpg", "Coin_-_Bitcoin-512.png", "jpy.png", "1479910907_2.png", "1480323779_usd.png", "Hundred-dollar-bill.jpg"].sample, description: Faker::Lorem.paragraphs(1), detail: Faker::Lorem.paragraphs(5), active: 'publish', shop_category_id: Shop::Category.select(:id).where(category_type: "product").to_a.sample[:id])
end

Shop::OrderStatus.delete_all
Shop::OrderStatus.create! id: 1, name: "In Progress"
Shop::OrderStatus.create! id: 2, name: "Placed"
Shop::OrderStatus.create! id: 3, name: "Shipped"
Shop::OrderStatus.create! id: 4, name: "Cancelled"

User.create(email: 'nt.apple.it@gmail.com', password: '123456', name: 'Nguyen Thuan', birthdate: Time.now, address: '972/24/7 Quang Trung - Go Vap - HCM', phone: '0975165068', is_male: true, admin: true)