# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper
  def self.page
    Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def self.tournaments
    self.page.css(".tournaments-listing-all")
  end

  def self.make_c_tournaments
    self.tournaments.each do |tournaments|
      tournaments.css(".tournament-C").map do |ctier|
        # binding.pry
        tourneyC = Tournament.new
        tourneyC.name = ctier.css("em").text
        tourneyC.date = ctier.css(".t-date").text
        tourneyC.tier = ctier.css(".info.ts").text
      end
    end
  end
end
