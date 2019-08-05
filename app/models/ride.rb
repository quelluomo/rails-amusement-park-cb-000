class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  #validates :user_id, :attraction_id, presence: true

  def take_ride
    if poor && short
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif poor
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif short
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      ride_taken
      "Thanks for riding the #{self.attraction.name}."
    end
  end



  def poor
    self.user.tickets < self.attraction.tickets
  end

  def short
    self.user.height < self.attraction.min_height
  end

  def new_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def new_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def new_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def ride_taken
    self.user.update(:tickets => new_tickets, :nausea => new_nausea, :happiness => new_happiness)
  end


end
