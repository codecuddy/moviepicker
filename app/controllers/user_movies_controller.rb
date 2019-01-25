class UserMoviesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def random
  end

  private

  def find_movie
    @movie = @user_movie_movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :service, :genre, :overview, :photo, :language, :adult)
  end
end
