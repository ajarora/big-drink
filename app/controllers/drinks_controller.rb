class DrinksController < ApplicationController
  def new
    @drink = Drink.new(@drink)
  end
  
  def index
  end

  def create
    @drink = Drink.new(params[:drink])
    if @drink.save
      flash[:success] = "#{@drink.name} Successfully Added!"
      redirect_to @drink
    else
      render 'new'
    end
  end
end