class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  #validates :user_id, :attraction_id, presence: true

  def take_ride
    if self.poor && self.short
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.poor
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.short
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.ride_taken
      "Thanks for riding the #{attraction.name}."
    end
  end

  private

  def self.poor
    self.user.tickets < self.attraction.tickets
  end

  def self.short
    self.user.height < self.attraction.min_height
  end

  def self.new_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def self.new_nausea
    user.nausea += self.attraction.nausea_rating
  end

  def self.new_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def self.ride_taken
    self.user.update(:tickets => new_tickets, :nausea => new_nausea, :happiness => new_happiness)
  end


end
