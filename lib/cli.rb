# frozen_string_literal: true

class CLI
  def call
    EventScraper.new.scrape_tournaments
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, \
& what competition level they are based on their 'tier'"
    puts "Please type 'list' to see the list or type 'exit'"
    input = gets.strip
      if input == "list"
        tournament_list
      elsif input == "exit"
        goodbye
      else
        puts "I'm not sure what that is, please type list or exit"
      end
  end

  def menu
      puts ""
      puts "Please type an ID# to see more details \
for that tournament or type exit:"
      input = gets.strip.to_i
  end

  def tournament_list
    puts "Master List of tournaments:".colorize(:red)
    Tournament.all.map do |tourney|
      puts "Tournament ID: #{tourney.id}".colorize(:light_blue)
      puts "Name: #{tourney.name}".colorize(:green)
      puts "Date: #{tourney.date}".colorize(:green)
      puts "Tier: #{tourney.tier}".colorize(:green)
      puts "---------------------------------------------------------------".colorize(:yellow)
    end
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
