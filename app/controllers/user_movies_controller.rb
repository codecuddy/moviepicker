class UserMoviesController < ApplicationController
  #before_action :find_user_movie, only: [:show, :edit, :update, :destroy]
  def show
  end
  
  def destroy
    @user_movie = current_user.user_movies.find(params[:id])
    puts "-----------------------------------#{@user_movie.attributes}"
    puts "-----------------------------------#{@user_movie.movie_id}"
    #puts "$$$$$$$$$$$$$$$$$$$$ #{@movie.attributes}"
    puts "--------------------will destroy USER movie--------------------"
    @user_movie.destroy
    puts "--------------------destroyed USER movie--------------------"
    redirect_to root_path
  end

  private

  #def find_user_movie
    #@user_movie = current_user.movies.find(params[:id])
  #end
end
