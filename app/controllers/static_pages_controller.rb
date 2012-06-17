class StaticPagesController < ApplicationController
  
  def home
    @drinks = Drink.paginate(page: params[:page])
    @json = Venue.all.to_gmaps4rails
  end  
end