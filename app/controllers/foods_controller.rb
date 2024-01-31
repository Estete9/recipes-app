class FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy]
  before_action :food_by_user, only: %i[index new create destroy]

  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
    @inventory_id = params[:inventory_id]
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      flash[:notice] = 'The Food was created successfully!'
      associate_with_inventory if params[:inventory_id].present?
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

  def detailed_food
    @food = Food.find(params[:id])
    # Add any additional details needed for the detailed view
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def food_by_user
    @food = current_user.foods
  end

  def associate_with_inventory
    inventory = Inventory.find(params[:inventory_id])
    inventory.foods << @food
    redirect_to inventory_path(inventory)
  end


end
