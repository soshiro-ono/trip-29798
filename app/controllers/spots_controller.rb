class SpotsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show,:search]
  before_action :set_spot, only: [:edit, :show, :update,:destroy]  
  before_action :search_spot, only: [:index, :search]

  def index
    @spots = Spot.all.page(params[:page]).per(9)
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
    @comment = Comment.new
    @comments = @spot.comments.includes(:user)
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

  def search
    @spots = @p.result
  end
  
  
  private
  def spot_params
    params.require(:spot).permit(:title, :image, :description, :genre_id, :city_id, :location_id, :price).merge(user_id: current_user.id)
  end
  
  def set_spot
    @spot = Spot.find(params[:id])
  end
  # edit, :show, :update,:destroyをまとめている
  
  def search_spot
    @p = Spot.ransack(params[:q])  # 検索オブジェクトを生成
  end
  
end

