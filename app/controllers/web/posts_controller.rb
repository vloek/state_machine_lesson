class Web::PostsController < Web::ApplicationController
	respond_to :html

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.create!(params[:post])
		redirect_to posts_url
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to posts_url, notice: 'Updated'
		else
			render :edit, notice: 'Error Update!'
		end
	end

end
