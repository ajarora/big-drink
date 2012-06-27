class LikesController < ApplicationController

  def create
    @drink = Drink.find(params[:like][:liked_id])
    @drink.like!(current_user)
    @graph = Koala::Facebook::GraphAPI.new(current_user.fb_access_token)
    @graph.put_connections("me", "og.likes", :object => Rails.application.routes.url_helpers.drink_url(@drink))
  end
  
  def destroy
    @drink = Like.find(params[:id]).liked
    @drink.unlike!(current_user)
    head :ok
  end
end