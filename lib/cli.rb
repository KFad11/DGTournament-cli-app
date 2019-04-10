# handles putsing info to user, and the least amount possible besides that
class CLI

  def call
    welcome
    tournament_list
    menu
    goodbye
  end

  def welcome
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, & what competition level they are based on their 'tier'"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please type a specific tier to see just those tournaments or type exit:"
      input = gets.strip.downcase
      case input
      when "c"
        puts "C Tier is the lowest tier"
        puts "C Tier list"
      when "b"
        puts "B Tier is a mid tier"
        puts "B Tier list"
      when "x"
        puts "X Tier are experimental and have special rules applied"
        puts "X Tier list"
      when "c/b"
        puts "C/B Tier are split for the Professional and Amatuer Divisions"
        puts "C/B Tier list"
      when "doubles"
        puts "Doubles events are played with a partner"
        puts "Doubles Tier List"
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
