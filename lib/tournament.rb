# never scrapes, never puts, handles only things dealing with a tournament
class Tournament
  attr_accessor :name, :date, :tier

  @@all = []

  def initialize(name, date, tier)
    # binding.pry
    @name = name
    @date = date
    @tier = tier
    @@all << self
  end

  def self.all
    # binding.pry
    @@all
  end

end
