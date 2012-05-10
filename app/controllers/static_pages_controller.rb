class StaticPagesController < ApplicationController
  def home
    @drinks = Drink.paginate(page: params[:page])
  end
end
