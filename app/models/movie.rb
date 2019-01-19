class Movie < ApplicationRecord
  belongs_to :user, optional: true
  validates_uniqueness_of :title, :scope => :user




end
