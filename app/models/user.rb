class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password

  def mood
     if self.happiness && self.nausea
       mood = self.happiness - self.nausea
       mood > 0 ? "happy" : "sad"
     end
   end

  #validates :name, :password, :happiness, :nausea, :height, :tickets, presence: true
end
