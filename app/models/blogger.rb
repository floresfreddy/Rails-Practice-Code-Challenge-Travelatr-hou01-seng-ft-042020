class Blogger < ApplicationRecord


    has_many :posts
    has_many :destinations, through: :posts

    validates_uniqueness_of :name, :allow_blank => true
    validates :age, numericality: {only_integer: true, greater_than: 0}
    validates :bio, length: { minimum: 30 }

end
