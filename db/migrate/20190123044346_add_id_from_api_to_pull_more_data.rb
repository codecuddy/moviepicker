class AddIdFromApiToPullMoreData < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :movie_id, :integer

  end
end
