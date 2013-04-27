class PostsController < ApplicationController
  layout 'application'
  def index
    @posts = Post.all(:order => "created_at DESC")
  end
  
  def create
    @post = Post.create(:message => params[:message])
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = "Message failed to save."
      redirect_to posts_path
    end  
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
end
