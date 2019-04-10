# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper

  def self.get_page
    Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def self.get_tounaments
    self.get_page.css(".tournaments-listing-all")
  end

  def self.make_c_tournaments
    self.get_tounaments.each do |tournaments|
      tournaments.css(".tournament-C").map do |ctier|
        tourney = Tournament.new
        tourney.name = ctier.css("em").text
      end
    end
  end

end
