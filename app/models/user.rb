class User < ApplicationRecord
  validates :username, {presence: true, uniqueness: true, length: {:within => 4..40}}
  validates :password, {presence: true, length: {:within => 6..40}}
  has_many :todo_items
  has_many :todo_lists

  #bcrypt helper method
	has_secure_password

end
