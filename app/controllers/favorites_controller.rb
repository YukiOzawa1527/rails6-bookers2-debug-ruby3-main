class FavoritesController < ApplicationController

 def create
  user = user.find(params[:user_id])
  favorite = current_user.favorite.new(user_id: user_id)
  favorite.save
  ridirect_to books_path
 end

 def destroy
  user = user.find(params[:user_id])
  favorite = current_user.favorite.find_by(user_id: user_id)
  favorite.destroy
  redirect_to books_path
 end

end
