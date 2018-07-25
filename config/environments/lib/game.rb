require 'duel_master'

class Game

  def self.run
    w = Warrior.new
    t = Tank.new
    Duel.duel(w,t,Turnbased)
  end

end
