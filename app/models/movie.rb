class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, through: :user_movies
  validates_uniqueness_of :title, :scope => [:user]

end
