# never scrapes, never puts, handles only things dealing with a tournament
class Tournament
  attr_accessor :name, :date, :tier, :url, :id

  @@all = []
  @@current_id = 1

  def initialize(name, date, tier, url)
    # binding.pry
    @name = name
    @date = date
    @tier = tier
    @url = url
    @id = @@current_id
    @@all << self
    @@current_id += 1
  end

  def self.all
    # binding.pry
    @@all
  end

  def self.find_by_id(id)
    all.find do |x|
      x.id == id
    end
  end
end
