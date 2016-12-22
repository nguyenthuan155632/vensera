module Shop::PostsHelper
	# def fetch_posts
	# 	posts =  $redis.get("posts")
	# 	if posts.nil?
	#     posts = Shop::Post.where(:active => "publish").order(created_at: :desc).to_json
	#     $redis.set("posts", posts)
	#     $redis.expire("posts", 5.hour.to_i)
	#   end
	#   @posts = JSON.load posts
	# end
end
