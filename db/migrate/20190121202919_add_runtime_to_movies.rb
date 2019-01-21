class AddRuntimeToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :runtime, :integer

  end
end
