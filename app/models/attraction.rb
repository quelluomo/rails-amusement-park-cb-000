class Attraction < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :users, through: :rides

  #validates :name, :min_height, :nausea_rating, :happiness_rating, :tickets, presence: true
end
