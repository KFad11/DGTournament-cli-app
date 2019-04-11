# handles putsing info to user, and the least amount possible besides that
class CLI
  def call
    menu
    goodbye
  end

  def menu
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, & what competition level they are based on their 'tier'"
    input = nil
    scraper = EventScraper.new
    scraper.make_tournaments
    while input != "exit"
      puts "Please type 'List' to see all tournaments, a specific tier option if you know one, or type exit:"
      input = gets.strip.downcase
      case input
      when "list"
        tournament_list
      else
        puts "Not a valid search, please type list or exit"
      end
    end
  end

  def tournament_list
    puts "Master List of tournaments:".colorize(:red)
    Tournament.all.map do |tourney|
      puts "Name: #{tourney.name}".colorize(:green), "Date: #{tourney.date}".colorize(:light_blue), "Tier: #{tourney.tier}".colorize(:green)
      puts "---------------------------------------------------------------".colorize(:red)
    end
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end
