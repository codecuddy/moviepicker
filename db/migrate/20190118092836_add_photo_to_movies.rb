class AddPhotoToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :photo, :string
  end
end
