class AddUserIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :user_id, :string
    add_index :movies, :user_id
  end
end
