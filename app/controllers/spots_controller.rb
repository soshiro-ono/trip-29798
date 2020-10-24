class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @Spot = Spot.new
  end
end
