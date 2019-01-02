class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.sort
  end

  def new
    @movies = Movie.new(params[:id])
  end

  def create
    @movie = Movie.new

    if @movie.save
      redirect_to '/' , notice: "Movie Entered"
    else
      render 'new'
    end
  end

  def show
  end

  #def destroy
  # @movie.destroy
  # redirect_to root_path
  #end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :service)
  end


end
