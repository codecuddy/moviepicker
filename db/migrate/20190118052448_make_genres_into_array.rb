class MakeGenresIntoArray < ActiveRecord::Migration[5.0]
  def up
    change_column :movies, :genre, :string, default: [].to_yaml, array: true
    #, using: "(string_to_array(genre, ','))"
    # Movies.find_all do |movie|
    #   movie.genre = movie.genre.split(',')
    #   movie.save
    # end
  end

  def down
    change_column :movies, :genre, :string
    #, using: "(string_to_array(genre, ','))"
    # Movies.find_all do |movie|
    #   movie.genre = movie.genre.split(',')
    #   movie.save
    # end
  end
end
