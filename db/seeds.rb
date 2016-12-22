# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
	category_name = Faker::Name.name
	Shop::Category.create(category_name: category_name, category_slug: Faker::Internet.slug(category_name, '-'), category_type: ["post", "product"].sample)
end

20.times do
	title = Faker::Lorem.sentence
	Shop::Post.create(title: title, slug: Faker::Internet.slug(title, '-'), thumbnail: ["anh-bia-facebook-6.jpg", "slide-mushroom2.jpg", "blue-money-icon-pz-icon34.jpg", "Coin_-_Bitcoin-512.png", "jpy.png", "1479910907_2.png", "1480323779_usd.png", "Hundred-dollar-bill.jpg"].sample, content: Faker::Lorem.paragraph, active: "publish", description: Faker::Lorem.paragraphs(1), shop_category_id: Shop::Category.select(:id).to_a.sample[:id])
end