# frozen_string_literal: true

class AboutTournament
attr_accessor :name, :about

  @@all = []

  def initailize(name = nil, about = nil)
    @name = name
    @about = about
    @@all << self
  end

  def self.all
    @@all
  end
end
