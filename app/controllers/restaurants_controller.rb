class RestaurantsController < ApplicationController



  def index
    @restaurants = Restaurant.all

  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
      @restaurant = Restaurant.find_by(id: params[:id])
      if @restaurant.update(restaurant_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end


  def new
    @restaurant = current_user.restaurants.build
    # @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else
    render 'new'
   end
  end


  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.delete

      redirect_to restaurants_path
    else
      render @restaurant
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :sign, :price)
  end
end
