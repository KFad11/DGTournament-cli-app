# frozen_string_literal: true

class AboutTournament
attr_accessor :name, :info

  @@all = []

  def initailize(name = nil, info = nil)
    @name = name
    @info = info
    @@all << self
  end

  def self.all
    @@all
  end

end
