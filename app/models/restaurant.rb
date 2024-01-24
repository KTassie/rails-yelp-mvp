class Restaurant < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end
end
