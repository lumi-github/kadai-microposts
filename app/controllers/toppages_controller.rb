class ToppagesController < ApplicationController
  
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build # form_for用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      @favorite_ids = current_user.bookmark_micropost_ids
    end
  end
end
