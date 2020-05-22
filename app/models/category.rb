class Category < ApplicationRecord
    has_many :recipes
    belongs_to :user

    validates :name, presence: true, uniqueness: true

end
