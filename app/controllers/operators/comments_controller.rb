class Operators::CommentsController < Operators::BaseController
	before_action :get_post_comments, only: [:posts]

	def posts
		
	end

	def products
		
	end

	def get_comment
		comment = Shop::Comment.find(params[:id])
		comment.update(:is_read =>  true)
    time_created = comment.created_at.in_time_zone("Asia/Bangkok").strftime("%I:%M %p")
    date_created = comment.created_at.in_time_zone("Asia/Bangkok").strftime("%d %b %Y")
		render :json => comment.as_json.merge(:time_created => time_created, :date_created => date_created, :title => comment.commentable.title)
	end

	def delete_comment
		comment = Shop::Comment.find(params[:id]).destroy
	end

	def reply_comment
		id_cm = params[:id_cm]
		id_type = params[:id_type]
		comment = params[:comment]
		type = params[:type]
		cm = Shop::Comment.new({ content: comment, commentable_type: type, commentable_id: id_type, reply: id_cm.to_i, is_read: true })
		cm.save
	end

	private
		def get_post_comments
			@post_comments = Shop::Comment.where(:commentable_type => "Shop::Post", :reply => nil).order(created_at: :desc)
		end
end