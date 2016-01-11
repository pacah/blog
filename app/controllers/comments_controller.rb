# encoding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html
  def create
		@post = Post.find(params[:comment][:post_id])
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
     redirect_to post_path(@post)
    else
     fail
    end
   end 
end
