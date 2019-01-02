class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movies = Movie.new(params[:id])
  end

  def create
    @movie = Movie.new(params[:id])

    if @movie.save
      redirect_to movie_path, notice: "Movie Entered"
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

  #def movie_params
  #  params.require(:movie).permit(:title, :service)
  #end


end
