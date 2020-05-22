class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    
    has_many :recipes 
    has_many :categories 
    has_many :ingredients
end
