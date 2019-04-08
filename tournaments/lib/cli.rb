#this is the controller
class CLI

  def call
    list_tournaments
    menu
    goodbye
  end

  def list_tournaments
    puts "Upcoming Tournaments:"
    puts <<-DOC.gsub /^\s*/, ''
      1. 2019 Treeze - Saturday, April 13 - Ctier
      2. 2019 Breeze - Sunday, April 14 - Ctier
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the tournament you'd like to see, or type list to see the tournaments again, or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Tourney1"
      when "2"
        puts "Tourney2"
      when "list"
        list_tournaments
      end
    end
  end

  def goodbye
    puts "Come back later to see upcoming tournaments!"
  end
end
