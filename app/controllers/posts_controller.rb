class PostsController < ApplicationController
# before_action :authenticate, only: [:index]
  before_action :authenticate
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
		post = Post.new(post_params)
		if post.save
			flash[:message] = 'Your post was created successfully'
			redirect_to '/posts'
		else
			flash[:message] = 'try again'
			render '/posts/new'
		end
    end
    
    private

def post_params
	params.require(:post).permit(:title, :content)
end

end
