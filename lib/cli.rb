# frozen_string_literal: true

class CLI
  def call
    welcome_message
    tournament_list
    make_selection

    input = gets.strip.to_i

    tourney = tournament_locator(input)
    tournament_info(tourney)

    goodbye
  end

  def welcome_message
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, \
& what competition level they are based on their 'tier'"
    puts "Please type 'list' to see the list of tournaments or exit to end the program"
  end

  def tournament_list
    puts "Master List of tournaments:"
    EventScraper.new.scrape_tournaments
    Tournament.all.map do |tourney|
      puts "Tournament ID: #{tourney.id}"
      puts "Name: #{tourney.name}"
      puts "Date: #{tourney.date}"
      puts "Tier: #{tourney.tier}"
      puts "---------------------------------------------------------"
    end
  end

  def make_selection
    puts "Please choose a tournament by typing in it's ID#:"
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
    puts "-------------------------------------"
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
