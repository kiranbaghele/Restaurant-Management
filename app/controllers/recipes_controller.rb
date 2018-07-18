class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

  end

  def show
    @recipe = Recipe.find_by(id: params[:id])

  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
      @recipe = Recipe.find_by(id: params[:id])
      if @recipe.update(recipe_params)
        redirect_to recipes_path
      else
        render 'edit'
      end
    end


  def new
    @recipe = Recipe.new
    @recipe.initialize_nested_attributes
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
    render 'new'
   end
  end

  def add_new_ingredient
    @counter = params[:counter]
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.delete

      redirect_to recipes_path
    else
      render @recipe
    end
  end

  private
  def recipe_params
    # params.require(:recipe).permit(:dish_name, :sign, :price, :recipe_direction)
    params.require(:recipe).permit!
  end
end
