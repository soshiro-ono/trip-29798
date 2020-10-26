class SpotsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.create(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end


  private
  def spot_params
    params.require(:spot).permit(:title, :image, :description).merge(user_id: current_user.id)
  end

end
