# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper
  def page
    @page ||= Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def make_tournaments
    page.css(".tournaments-listing-all").map do |tournaments|
      name = tournaments.css("em").text
      date = tournaments.css(".t-date").text
      tier = tournaments.css(".info.ts").text
      Tournament.new(name, date, tier)
    end
  end

  # def self.print_tournaments
  #   self.make_tournaments
  #   Tournament.all.each do |tourney|
  #     if tourney.name
  #       puts "Name:#{tourney.name}, Date:#{tourney.date}, Tier:#{tourney.tier}" # this goes in cli
  #     end
  #   end
  # end

  # def self.make_c_tournaments
  #   C_events = []
  #   self.get_tournaments.each do |tournaments|
  #     tournaments.css(".tournament-C").map do |ctier|
  #       # binding.pry
  #       tourneyC = Tournament.new(name, date, tier)
  #       tourneyC.name = ctier.css("em").text
  #       tourneyC.date = ctier.css(".t-date").text
  #       tourneyC.tier = ctier.css(".info.ts").text
  #       C_events << tourneyC
  #     end
  #   end
  #   C_events
  # end

end
