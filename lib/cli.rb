# handles putsing info to user, and the least amount possible besides that
class CLI

  def call
    welcome
    menu
    goodbye
  end

  def welcome
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "Here we can see what disc golf tournaments are happening, when, and what competition level they are based on their 'tier'"
    puts "B Tier tournaments are higher than C Tier in terms of competition"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please select 'C' for a list of C Tiers, or 'B' for B Tiers, or type exit:"
      input = gets.strip.downcase
      case input
      when "c"
        puts "C Tier list"
      when "b"
        puts "B Tier list"
      else
        puts "Not a valid tier to search, type either the tier letters"
      end
    end
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end

#EventScraper.make_c_tournaments
