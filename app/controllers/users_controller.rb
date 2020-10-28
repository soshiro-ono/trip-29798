class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @spots = user.spots
  end
end
# 応用カリキュラムを参照。