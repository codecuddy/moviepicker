class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  #before_action :find_user_movie, only: [:show, :edit, :show, :destroy]

  def index
    if params[:search]
      @movies = Movie.search(params[:search]).order("title ASC")
    else
      @movies = Movie.paginate(page: params[:page], per_page: 120).order("title ASC")
    end
  end

  def home
    @user_movies = current_user.movies.paginate(page: params[:page], per_page: 20).order("title ASC")
  end

  def new
  end

  def show
    puts "*********************** showing page ***********************"
    puts "!!!!!!!!!!!!!!!!!!! #{@movie.title} !!!!!!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!! #{@movie.movie_id} !!!!!!!!!!!!!!!!!!!!!!!"

    puts "https://api.themoviedb.org/3/movie/"+@movie.movie_id.to_s+"?api_key="+ENV['MOVIES_DB_API_KEY']
    response = RestClient.get "https://api.themoviedb.org/3/movie/"+@movie.movie_id.to_s+"?api_key="+ENV['MOVIES_DB_API_KEY']
    puts "** #{@response}"
    if response.code == 500
      raise "Issues with URL in movies show controller"
    else
      data = JSON.parse(response.body).symbolize_keys!
      puts "+++------ #{data} ------+++"
      @movie.runtime = data[:runtime]
      @movie.save
      puts "------ #{@movie.runtime} ------"

    end
    puts "!!!!!!!!!!!!!!!!!!! #{@movie.title} !!!!!!!!!!!!!!!!!!!!!!!"
  end

  def create
    #@movie = current_user.movies.new(movie_params
    @movie = Movie.new(movie_params)
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

  def user_random
    @movie = current_user.movies.order("RANDOM()").first
    redirect_to movie_path(@movie)
  end

  def search_movies

  end

  def show_clicked
    @user_movie = Movie.find(params[:movie_id])
    puts "---:)-----------------------------MOVIE: #{@user_movie.attributes}----------------------------------"
    #current_user = current_user
    #puts "----------------------------------USER: #{current_user.attributes}----------------------------------"
  begin
    current_user.movies << @user_movie
    current_user.save!
  rescue ActiveRecord::RecordInvalid
    puts "$$$$$$$$$$$$$$$$$$$$$$$ no no no MOVIE ALREADY IN LIBRARY $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  end

    #@user_movie_ids = current_user.movies.ids.uniq!
    puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.ID: #{@user_movie.id}----------------------------------"
    puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.MOVIE-ID: #{@user_movie.movie_id}----------------------------------"
    puts "----------------------------------Save MOVIE-TITLE: #{@user_movie.title}----------------------------------"
    puts "----------------------------------Save MOVIE-OVERVIEW: #{@user_movie.overview.truncate(20)}----------------------------------"
    puts "----------------------------------Save MOVIE-PHOTO: #{@user_movie.photo}----------------------------------"
    puts "----------------------------------Save MOVIE-language: #{@user_movie.language}----------------------------------"
    puts "----------------------------------Save MOVIE-GENRE: #{@user_movie.genre}----------------------------------"
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

  #def find_user_movie
    #@user_movie = current_user.movies(params[:movie_id])
  #end

  def movie_params
    params.require(:movie).permit(:title, :service, :genre, :overview, :runtime, :photo, :language, :release_date, :adult, :user_movies, :search)
  end
end
