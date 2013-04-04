class PostsController < ApplicationController
	respond_to :html

	def index
		@posts = Post.all
	end

	def blog
		@posts = Post.where(:state => 'published')
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
			@post.publicate if params[:published]
			redirect_to posts_url, notice: 'Updated'
		else
			render :edit, notice: 'Error Update!'
		end
	end

end