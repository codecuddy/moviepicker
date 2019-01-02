class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  def index
    @movies = Movie.all
  end

  def new
    @movies = Movie.new(movie_params)
  end

  #def create
  #@movie = Moview.new(movie_params)

  #  if @movie.save
  #    redirect_to @movie, notice: "Movie Entered"
  #  else
  #    render 'new'
  #  end
  # end

  def show
    @movie = Movie.find_movie
  end

  #def destroy
  # @movie.destroy
  # redirect_to root_path
  #end

  private

  def movie_params
    params.require(:movie).permit(:title, :service)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
