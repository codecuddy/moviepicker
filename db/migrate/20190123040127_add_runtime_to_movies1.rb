class AddRuntimeToMovies1 < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :runtime_s, :string

  end
end
