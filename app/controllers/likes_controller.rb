class LikesController < ApplicationController

  def create
    @drink = Drink.find(params[:like][:liked_id])
    @drink.like!(current_user)
    @graph = Koala::Facebook::GraphAPI.new(current_user.fb_access_token)
    @graph.put_connections("me", "#{FB_NAMESPACE}:Like", :drink => Rails.application.routes.url_helpers.drink_url(@drink))
  end
end