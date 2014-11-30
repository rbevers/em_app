class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :omniauthable
  # :registerable, :recoverable, :lockable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :timeoutable
end
