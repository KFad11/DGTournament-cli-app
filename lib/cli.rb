# frozen_string_literal: true

class CLI
  def call
    EventScraper.new.scrape_tournaments
    welcome_message
    start
  end

  def start
    tournament_list
    while true do
      make_selection

      input = gets.strip.downcase
      if input == "exit"
        goodbye
        exit
      elsif input.to_i <= 0
        puts ""
        puts "I don't understand that answer, let's start over."
      elsif
        tourney = tournament_locator(input)
        tournament_info(tourney)
      end
    end
  end

  def welcome_message
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, \
& what competition level they are based on their 'tier'"
  end

  def tournament_list
    puts "Master List of tournaments:"
    Tournament.all.map do |tourney|
      puts "Tournament ID: #{tourney.id}"
      puts "Name: #{tourney.name}"
      puts "Date: #{tourney.date}"
      puts "Tier: #{tourney.tier}"
      puts "---------------------------------------------------------"
    end
  end

  def make_selection
    puts "Please choose a tournament by typing in it's ID#, or type exit to quit:"
  end

  def tournament_info(tourney)
    EventScraper.new.scrape_tournament_info(tourney)
    puts "Here is the info about #{tourney.name}"
    puts "Info: #{tourney.info}"
  end

  def tournament_locator(input)
    Tournament.find_by_id(input.to_i)
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
