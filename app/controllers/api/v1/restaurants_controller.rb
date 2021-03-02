class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :update]

  def index
    @restaurants = policy_scope(Restaurant)
    # render json: @restaurants
  end

  def show
  end

  # patch request from the form { restaurant: { name: '', address: ''}}
  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
      # {error: 'hey you did something wrong'}
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      render :show, status: :created
    else
      render_error
      # {error: 'hey you did something wrong'}
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant # it's called record in pundit
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
  end
end
