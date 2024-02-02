class FoodRecipesController < ApplicationController
  before_action :set_food_recipe, only: %i[destroy]

  # GET /food_recipes/new
  def new
    @food_recipe = FoodRecipe.new
    @foods = current_user.foods
  end

  # POST /food_recipes or /food_recipes.json
  def create
    @food_recipe = FoodRecipe.new(food_recipe_params)

    respond_to do |format|
      if @food_recipe.save
        format.html do
          redirect_to recipe_path(id: @food_recipe.recipe_id), notice: 'Food recipe was successfully created.'
        end
        format.json { render :show, status: :created, location: @food_recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_recipes/1 or /food_recipes/1.json
  def destroy
    @food_recipe.destroy!

    respond_to do |format|
      format.html { redirect_to food_recipes_url, notice: 'Food recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_recipe
    @food_recipe = FoodRecipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_recipe_params
    params.require(:food_recipe).permit(:quantity, :food_id, :recipe_id)
  end
end
