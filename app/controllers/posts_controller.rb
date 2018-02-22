class PostsController < ApplicationController
# before_action :authenticate, only: [:index]
  before_action :authenticate
    def index
        @posts = Post.all
    end

    def new
        @user = User.find(session[:user_id])
        @post = Post.new
    end

    def create
        @user = User.find(session[:user_id])
        post = Post.new(post_params)
        # @user.posts.create(post_params)
		if post.save
			flash[:message] = 'Your post was created successfully'
			redirect_to "/users/#{@user.id}"
		else
			flash[:message] = 'try again'
			render '/posts/new'
		end
    end
    
    private

def post_params
	params.require(:post).permit(:title, :content, :user_id)
end

end
