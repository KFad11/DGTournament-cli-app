# handles putsing info to user, and the least amount possible besides that
class CLI

  def call
    puts "Welcome to Pennsylvania Tournament Tracker"
    puts "Please select 'C' for a list of C Tiers, or 'B' for B Tiers:"
    EventScraper.make_c_tournaments
    # puts "#{tourney.name}"
  end

end
