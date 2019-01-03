class User < ApplicationRecord
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
=======
  has_many :movies
>>>>>>> 2cef186d4fa2cb8a47be8e5ce506d3153f2aa1fd
end
