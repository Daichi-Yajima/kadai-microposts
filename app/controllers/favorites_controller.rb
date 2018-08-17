class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.fav(current_user)
    @favorites = Favorite.new(user_id: @user_id , micropost_id: @micoropost_id)
    
    if Favorite.create(user_id: @user_id , micropost_id: @micoropost_id)
      flash[:success] = 'お気に入りしました。'
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.unfav(current_user)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to current_user
  end
end
