# encoding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update, :destroy, :edit, :new]

  respond_to :html

  def index
  	if params[:query].present?
  		@posts = Post.search(params[:query], load: true)
  	else
	    @posts = Post.order('created_at DESC').all
	    respond_with(@posts)
    end
  end

  def show
    @post = Post.find(params[:id])
    #@comment = @post.comments.create(params[:comment])
    @comment = Comment.new
    @comment.post = @post
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
     respond_with(@post)
    else
      flash[:alert] = @post.errors.full_messages.join(", ")
    end
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
    respond_with(@post)
   else
   	render 'edit'
   end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url 
  end
  

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
