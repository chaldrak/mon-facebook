class User < ApplicationRecord
    validates :name, :surname, length: {in: 1..20}
    validates :sexe, presence: true
    before_validation {name.upcase!}
    before_validation {surname.capitalize!}
    validates :email, presence: true, length: {maximum: 255}, uniqueness: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation {email.downcase!}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    has_many :posts
end
