# frozen_string_literal: true

class CLI
  def call
    EventScraper.new.scrape_tournaments
    welcome_message
    start
  end

  def start
    tournament_list
    make_selection

    input = gets.strip.to_i
    if input <= 0
      puts ""
      puts "I don't understand that answer, let's start over."
      sleep(3)
      start
      exit
    end

    tourney = tournament_locator(input)
    tournament_info(tourney)

    goodbye
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
    puts "Please choose a tournament by typing in it's ID#, once a correct ID is chosen, the program will exit:"
  end

  def tournament_info(tourney)
    EventScraper.new.scrape_tournament_info(tourney)
    puts "Here is the info about #{tourney.name}"
    puts "Info: #{tourney.info}"
  end

  def tournament_locator(input)
    Tournament.find_by_id(input)
  end

  def goodbye
    puts "---------------------------------------------------------"
    puts "Above is the info you requested."
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
