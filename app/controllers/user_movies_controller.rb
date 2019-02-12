class UserMoviesController < ApplicationController
  #before_action :find_user_movie, only: [:show, :edit, :update, :destroy]


  #def show
    #@user_movie = current_user.user_movies.where(movie_id: @movie.id).first
  #end

  def destroy
    @user_movie = current_user.user_movies.find(params[:id])
    @user_movie.destroy
    redirect_to root_path
  end
end
