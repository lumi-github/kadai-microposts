class FavoritesController < ApplicationController

  def index
    if logged_in?
      @favorite_ids = current_user.bookmark_micropost_ids
      @microposts = Micropost.where(id: @favorite_ids).order('created_at DESC').page(params[:page])
    end
  end
  
  def create
    current_user.favorite(params[:micropost_id])
    flash[:success] = 'micropostをお気に入りに登録しました。'
    redirect_to :back
  end

  def destroy
    current_user.unfavorite(params[:id])
    flash[:success] = '選択したmicropostのお気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
end
