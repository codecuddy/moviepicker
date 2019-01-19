class AddOverviewToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :overview, :text
  end
end
