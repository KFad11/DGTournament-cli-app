# frozen_string_literal: true

class CLI
  def call

    welcome_message

    input = gets.strip.downcase
    if input == "list"
      tournament_list
    elsif input == "exit"
      goodbye
    else
      puts "I'm not sure what that is, let's start over."
      call
    end

    puts "Please select a Tournament ID by the number to see more info about it:"
    input = gets.to_i
      tourney = tournament_locator(input)
      tournament_info(tourney)

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

  def tournament_info(tourney)
    EventScraper.new.scrape_tournament_info(tourney)
      # binding.pry
      puts "Here's the info about #{tourney.name}"
      puts "Info: #{tourney.about}"
  end

  def tournament_locator(input)
    Tournament.find_by_id(input)
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end

