class User < ApplicationRecord
  has_secure_password   # makes 'password' field MANDATOR
  validates :email, presence: true, uniqueness: true

end
