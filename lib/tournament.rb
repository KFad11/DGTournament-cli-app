# never scrapes, never puts, handles only things dealing with a tournament
class Tournament
  attr_accessor :name, :date, :tier

  @@all = []

  def intialize(name, date, tier)
    @@all << self
  end

  def self.all
    @@all
  end

end
