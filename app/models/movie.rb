class Movie < ApplicationRecord
  # has_many relationship and is dependent on movie.  When move is destroyed, reviews are destroyed too
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
end
