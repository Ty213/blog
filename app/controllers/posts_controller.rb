class PostsController < ApplicationController
before_action :authenticate, only: [:index]
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
			# flash[:message] = 'Your post was created successfully'
			redirect_to "/users/#{@user.id}"
		else
			# flash[:message] = 'try again'
			render '/posts/new'
		end
    end

    def show
        @post = Post.find_by_id(params[:id])
        @comments = Comment.where(post_id: params[:id])
        @comment = Comment.new
    end

    def destroy
        @post = Post.find_by_id(params[:id])
        user = User.find_by_id(@post.user_id)
        @post.destroy()
        redirect_to "/users/#{user.id}"
    end

    def edit
        @post = Post.find_by_id(params[:id])
    end

    def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to "/posts/#{@post.id}"
		else
			flash[:message] = 'try again'
			render "/posts/#{@post.id}/edit"
		end
    end
    
    private

def post_params
	params.require(:post).permit(:title, :content, :user_id)
end

end
