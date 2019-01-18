require 'rest-client'

namespace :movies do
  desc "TODO"
  task create_all: :environment do
    (1..19902).each do |page_num|
      puts "Page Number: #{page_num} of 19,902"
      response = RestClient.get "https://api.themoviedb.org/3/discover/movie?page="+page_num.to_s+"&api_key="+ENV['MOVIES_DB_API_KEY']
      if response.code == 500
        raise "Issues with URL in movies.rake"
      else
        data = JSON.parse(response.body)
        data = data["results"]
        data.each do |movie_json|
          movie_json.symbolize_keys!
            #next if movie_json[:original_language] != "en"
          params = {}
          params[:title]= movie_json[:title]
          params[:overview] = movie_json[:overview]
          params[:photo] = movie_json[:poster_path]
          if params[:genre]
            params[:genre]= movie_json[:genres].collect{ |m| m['name'] }
          end
            movie = Movie.find_or_initialize_by(title:params[:title])
            if movie.id == nil
              Movie.create(params)
            else
              movie.update_attributes(title: params[:title], genre: params[:genre], overview: params[:overview], photo: params[:photo])
            end
        begin
          movie.save!
        rescue
          puts "#{movie_json[:title]} already exists"
        end
        end
      end
    end
  end

end
