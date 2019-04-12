# frozen_string_literal: true

class Tournament
  attr_accessor :name, :date, :tier, :url, :id

  @@all = []
  @@current_id = 1

  def initialize(name = nil, date = nil, tier = nil, url = nil)
    @name = name
    @date = date
    @tier = tier
    @url = url
    @id = @@current_id
    @@all << self
    @@current_id += 1
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id - 1]
  end
end
