class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all

  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])

  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
      @ingredient = Ingredient.find_by(id: params[:id])
      if @ingredient.update(ingredient_params)
        redirect_to ingredients_path
      else
        render 'edit'
      end
    end

  def get_search_data
       @ingredients = Ingredient.where(ingredient_name: /#{params[:query]}/i)

       puts "=========ingredients============>",@ingredients.to_a

       @data_array = @ingredients.pluck(:ingredient_name)

       puts "=========data_array============>",@data_array
       render json: { arr: @data_array}

  end

  def select_search
    # @ingredients = Ingredient.where(ingredient_name: /#{params[:query]}/i)
     # puts "=========iiiii============>",@ingredients
  end


  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
    render 'new'
   end
  end


  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    if @ingredient.delete

      redirect_to ingredients_path
    else
      render @ingredient
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :ingredient_id, :ingredient_quantity, :sign, :quantity_measure)
  end
end
