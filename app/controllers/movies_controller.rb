class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.where(:user_id => current_user.id).order('title ASC')
  end

  def new
    @movie = current_user.movies.new
  end

  def show
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie) , notice: "Movie Entered"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
  	  redirect_to movie_path(@movie), notice: "Movie Updated"
  	else
  	  render 'edit'
  	end
  end

  def destroy
   @movie.destroy
   redirect_to root_path
  end

  def random
    @movie = Movie.order("RANDOM()").first
    redirect_to movie_path(@movie)
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :service, :genre)
  end
end
