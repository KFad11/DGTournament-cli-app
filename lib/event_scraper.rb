# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper
  attr_accessor :tourney
  def page
    @page ||= Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def make_tournaments
    page.css(".tournaments-listing-all").children.each do |tournament|
      # binding.pry
      next if tournament.attr('style') == "text-align: center;"
      name = tournament.css("em").map { |name| name.text.strip }.first
      date = tournament.css(".t-date").map { |date| date.text.strip }.first
      tier = tournament.css(".info.ts").map { |tier| tier.text.strip }.first
        if tier == ""
          tier = "Unsanctioned"
        end
      url = tournament.css("div.a").map { |url| url["href"] }

      @tourney = Tournament.new(name, date, tier, url)
    end
  end

  def scrape_details(tourney)
    binding.pry
    ind_tourney = Nokogiri::HTML(open(tourney.url))
    ind_tourney.css(".tounrament").each do |info|
      info = tournament.css(".tournament-about").text.strip
    end
  end

end
