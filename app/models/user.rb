class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients, through: :recipes
  has_many :types, through: :recipes
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :username

end