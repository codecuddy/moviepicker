class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end
end
