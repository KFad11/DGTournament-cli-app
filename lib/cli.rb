# handles putsing info to user, and the least amount possible besides that
class CLI
  def call
    menu
    tournament_list
    goodbye
  end

  def menu
    puts "Welcome to Pennsylvania Disc Golf Tournament Tracker"
    puts "See what disc golf tournaments are happening, when, & what competition level they are based on their 'tier'"
    input = nil
    EventScraper.new.make_tournaments
    while input != "exit"
      puts "Please type 'List' to see all tournaments, a specific tier option if you know one, or type exit:"
      input = gets.strip.downcase
      case input
      when "list"
        tournament_list
      when "c"
        puts "C Tier is the lowest tier"
        puts "C Tier list"
      when "b"
        puts "B Tier is a mid tier"
        puts "B Tier list"
      when "x"
        puts "X Tier are experimental events and have special rules applied"
        puts "X Tier list"
      when "c/b"
        puts "C/B Tier are split for the Professional and Amatuer Divisions"
        puts "C/B Tier list"
      when "doubles"
        puts "Doubles events are played with a partner"
        puts "Doubles Tier List"
      else
        puts "Not a valid search, please type list or exit"
      end
    end
  end

  def tournament_list
    puts "Master List of tournaments:"
    binding.pry
    Tournament.all.map do |tourney|
      puts "Name:#{tourney.name}, Date:#{tourney.date}, Tier:#{tourney.tier}"
    end
  end

  def goodbye
    puts "Come back soon to check up on the tournaments happening in PA!"
  end
end

#EventScraper.make_c_tournaments
