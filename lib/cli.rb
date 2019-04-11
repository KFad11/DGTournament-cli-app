# handles putsing info to user, and the least amount possible besides that
class CLI
  def call
    menu
  end

  def menu
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, & what competition level they are based on their 'tier'"
    input = nil
    scraper = EventScraper.new
    scraper.make_tournaments
    while input != "exit"
      puts "Please type 'list' to see all tournaments, or type an ID# to see more details for that tournament or type exit:"
      input = gets.strip.downcase
      case input
      when "list"
        tournament_list
      when "exit"
        goodbye
      else
        puts "Not a valid search, please type list or exit"
      end
    end
  end

  def tournament_list
    puts "Master List of tournaments:".colorize(:red)
    Tournament.all.map do |tourney|
      puts "Tournament ID:#{tourney.id}".colorize(:light_blue), "Name: #{tourney.name}".colorize(:green), "Date: #{tourney.date}".colorize(:light_blue), "Tier: #{tourney.tier}".colorize(:green)
      puts "---------------------------------------------------------------".colorize(:red)
    end
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
