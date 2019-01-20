class AddLanguageToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :language, :string

  end
end
