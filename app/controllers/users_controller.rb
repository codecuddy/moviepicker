class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  resources :users

  def index
    @users = current_user.id
  end


  private

  def find_user
    @movie = User.find(params[:id])
  end

  def user_params
    params.require(:user)
  end
end
