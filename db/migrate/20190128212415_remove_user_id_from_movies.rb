class RemoveUserIdFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :user_id
    remove_column :movies, :runtime
    remove_column :movies, :runtime_s
  end
end
