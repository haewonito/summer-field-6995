class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates :name, presence: true
  validates :age, presence: true

  def self.order_by_age
    order(:age)
  end
end
