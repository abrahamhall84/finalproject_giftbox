class User < ActiveRecord::Base

  has_secure_password
  
  has_many :items
  
  validates :username, :email, uniqueness: true
  validates :password, length: {minimum: 4}
  validates :first_name, :last_name, :address, presence: true
end
