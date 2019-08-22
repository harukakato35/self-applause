class PostsController < ApplicationController
   
   before_action :move_to_index, except: :index
   
   def index 
      @posts = Post.where(user_id: current_user).where("created_at >= ?", Time.zone.now.beginning_of_day).order("created_at DESC")
   end
   
   def new 
   end 
   
  def create
    Post.create(text: post_params[:text], user_id: current_user.id)
  end
  
   def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
   end

  private
  def post_params
    params.permit(:text)
  end
  
   def move_to_index
    redirect_to action: :index unless user_signed_in?
   end
end
