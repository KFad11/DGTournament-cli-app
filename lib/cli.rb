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
    puts "Master List of tournaments:".colorize(:red)
    EventScraper.new.scrape_tournaments
    Tournament.all.map do |tourney|
      puts "Tournament ID: #{tourney.id}".colorize(:light_blue)
      puts "Name: #{tourney.name}".colorize(:green)
      puts "Date: #{tourney.date}".colorize(:green)
      puts "Tier: #{tourney.tier}".colorize(:green)
      puts "---------------------------------------------------------".colorize(:yellow)
    end
  end

  def make_selection
    puts "Please choose a tournament by typing in it's ID#:".colorize(:light_green)
  end

  def tournament_info(tourney)
    EventScraper.new.scrape_tournament_info(tourney)
    puts "Here is the info about #{tourney.name}".colorize(:green)
    puts "Info: #{tourney.info}".colorize(:light_blue)
  end

  def tournament_locator(input)
    Tournament.find_by_id(input)
  end

  def goodbye
    puts "-------------------------------------".colorize(:yellow)
    puts "Come back soon to check up on the tournaments happening in PA!".colorize(:light_red)
  end
end
