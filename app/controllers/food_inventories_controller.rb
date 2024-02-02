class FoodInventoriesController < ApplicationController
  def new
    @food_inventory = FoodInventory.new
    @inventory_id = params[:inventory_id]
  end

  def create
    @food_inventory = FoodInventory.new(food_inventory_params)
    if @food_inventory.save
      flash[:success] = 'Food was successfully added to the inventory.'
      redirect_to inventory_path(id: @food_inventory.inventory_id)
    else
      render :new, alert: 'Failed to add ingredient'
    end
  end

  def destroy
    @food_inventory = FoodInventory.find(params[:id])

    if @food_inventory.destroy
      flash[:notice] = 'Food removed successfully.'
      redirect_to inventory_path(@food_inventory.inventory_id)
    else
      flash[:alert] = 'Failed to remove food.'
      redirect_back(fallback_location: inventory_path(@food_inventory.inventory_id))  # or any other fallback location
    end
  end

  private

  def food_inventory_params
    params.require(:food_inventory).permit(:quantity, :inventory_id, :food_id)
  end
end
