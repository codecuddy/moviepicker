class UserMoviesController < ApplicationController
  #before_action :find_user_movie, only: [:show, :edit, :update, :destroy]

  def destroy
    @user_movie = current_user.movies.find(params[:id])
    puts "-----------------------------------#{@user_movie.attributes}"
    puts "-----------------------------------#{@user_movie.movie_id}"

    @user_movie.destroy
    puts "--------------------destroying USER movie--------------------"
    redirect_to root_path
  end

  private

  #def find_user_movie
    #@user_movie = current_user.movies.find(params[:id])
  #end
end
