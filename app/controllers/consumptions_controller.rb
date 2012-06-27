class ConsumptionsController < ApplicationController

  def create
    @drink = Drink.find(params[:consumption][:drank_id])
    @drink.drink!(current_user)
    @graph = Koala::Facebook::GraphAPI.new(current_user.fb_access_token)
    @graph.put_connections("me", "#{FB_NAMESPACE}:drink", :drink => Rails.application.routes.url_helpers.drink_url(@drink))
  end
  
  def destroy
    @drink = Consumption.find(params[:id]).drank
    @drink.undrink!(current_user)
    head :ok
  end
end