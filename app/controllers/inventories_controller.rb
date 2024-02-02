class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show destroy]

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.where(user_id: current_user.id)
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    @food_inventories = FoodInventory.includes(:food).where(inventory_id: params[:id])
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params.merge(user: current_user))

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_url, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy!

    if @inventory.destroy
      flash[:notice] = 'Food removed successfully.'
      redirect_to inventories_path
    else
      flash[:alert] = 'Failed to remove food.'
      redirect_back(fallback_location: inventories_path)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
