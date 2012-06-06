class ConsumptionsController < ApplicationController

  def create
    @drink = Drink.find(params[:consumption][:drank_id])
    @drink.drink!(current_user)
    respond_to do |format|
      format.html
      format.js
    end
    @graph  = Koala::Facebook::GraphAPI.new(session[:access_token])
    @graph.put_connections("me", "#{FB_NAMESPACE}:drink", :drink => drink_url(@drink))
  end
end