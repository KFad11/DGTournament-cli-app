# frozen_string_literal: true

class Tournament
  attr_accessor :name, :date, :tier, :url, :id, :info

  @@all = []
  @@current_id = 1

  def initialize(name = nil, date = nil, tier = nil, url = nil, info = nil)
    @name = name
    @date = date
    @tier = tier
    @url = url
    @info = info
    @id = @@current_id
    @@all << self
    @@current_id += 1
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    all.find do |tourney|
      tourney.id == id
    end
  end
end
