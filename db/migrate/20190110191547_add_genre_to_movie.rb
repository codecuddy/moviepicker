class AddGenreToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :genre, :string
  end
end
