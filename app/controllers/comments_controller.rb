class CommentsController < ApplicationController
    def new
    end

    def create
        @user = User.find(session[:user_id])
        @comment = Comment.new(comment_params)
        # @user.posts.create(post_params)
		if @comment.save
			# flash[:message] = 'Your post was created successfully'
			redirect_to "/users/#{@user.id}"
		else
			# flash[:message] = 'try again'
			render '/posts/new'
		end
    end


    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
