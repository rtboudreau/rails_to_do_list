class User < ApplicationRecord
  validates :username, {presence: true, uniqueness: true}
  has_many :todo_items
  has_many :todo_lists

  #bcrypt helper method
	has_secure_password
  
end
