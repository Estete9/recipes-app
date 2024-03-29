class FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy]
  before_action :food_by_user, only: %i[index new create destroy]

  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id # Set the user_id to the ID of the current user

    if @food.save
      flash[:notice] = 'The Food was created successfully!'
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    if @food.destroy
      flash[:notice] = 'The Food was deleted successfully!'
    else
      flash[:alert] = 'The Food was not deleted!'
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def food_by_user
    @food = current_user.foods
  end
end
