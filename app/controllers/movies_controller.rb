class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 120).order("title ASC")
#    @search = params["search"]
#    if @search.present?
#      @title = @search["title"]
#      @movies = Movie.where(title: @title)
#    end
  end

  def home
    @user_movies = current_user.movies.paginate(page: params[:page], per_page: 20).order("title ASC")
  end

  def new
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
#    @movie = current_user.movies.order("RANDOM()").first
    @movie = Movie.order("RANDOM()").first
    redirect_to movie_path(@movie)
  end

  def user_random
    @movie = current_user.movies.order("RANDOM()").first
    redirect_to movie_path(@movie)
  end


  def show_clicked
    @user_movie = Movie.find(params[:movie_id])
    puts "---:)-----------------------------MOVIE: #{@user_movie.attributes}----------------------------------"
    #current_user = current_user
    #puts "----------------------------------USER: #{current_user.attributes}----------------------------------"
  begin
    current_user.movies << @user_movie
    current_user.save
  rescue ActiveRecord::RecordInvalid
    puts "$$$$$$$$$$$$$$$$$$$$$$$ no no no MOVIE ALREADY IN LIBRARY $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  end

    @user_movie_ids = current_user.movies.ids.uniq!
    puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.ID: #{@user_movie.id}----------------------------------"
    puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.MOVIE-ID: #{@user_movie.movie_id}----------------------------------"
    puts "----------------------------------Save MOVIE-TITLE: #{@user_movie.title}----------------------------------"
    puts "----------------------------------Save MOVIE-OVERVIEW: #{@user_movie.overview.truncate(20)}----------------------------------"
    puts "----------------------------------Save MOVIE-PHOTO: #{@user_movie.photo}----------------------------------"
    puts "----------------------------------Save MOVIE-language: #{@user_movie.language}----------------------------------"
    puts "----------------------------------Save MOVIE-ADULT: #{@user_movie.adult}----------------------------------"
    puts "----------------------------------Save MOVIE-YEAR: #{@user_movie.release_date}----------------------------------"
    puts "----------------------------------Save CURRENT USER EMAIL: #{@current_user.email}----------------------------------"
    puts "---:(-----------------------------Save MOVIE-IDs: #{@user_movie_ids}----------------------------------"
    redirect_to root_path

  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end


  def movie_params
    params.require(:movie).permit(:title, :service, :genre, :overview, :photo, :language, :adult, :user_movies)
  end
end
