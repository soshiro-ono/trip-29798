class SpotsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_spot, only: [:edit, :show, :update,:destroy]  

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
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      redirect_to root_path
    else
      redirect_to spot_path(@spot.id)
    end
  end


  private
  def spot_params
    params.require(:spot).permit(:title, :image, :description).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

end
