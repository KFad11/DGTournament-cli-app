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
