class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @food_recipes = FoodRecipe.includes(:food, :recipe).where(recipe_id: params[:id])
    @inventories = Recipe.where(user_id: current_user.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    user = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.user = user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update_attribute(:public, !@recipe.public)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { redirect_to recipe_url(@recipe), alert: 'Recipe was not updated.' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.food_recipes.destroy_all
    @recipe.destroy

     if @recipe.destroy
      flash[:notice] = 'Food removed successfully.'
      redirect_to recipes_path
    else
      flash[:alert] = 'Failed to remove food.'
      redirect_back(fallback_location: recipes_path)
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
