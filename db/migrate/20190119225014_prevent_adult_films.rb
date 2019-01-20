class PreventAdultFilms < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :adult, :string
  end
end
