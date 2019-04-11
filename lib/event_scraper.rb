# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper
  def page
    @page ||= Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def make_tournaments
    page.css(".tournaments-listing-all").map do |tournaments|
      # binding.pry
      name = tournaments.css("em").map { |name| name.text }.compact
      date = tournaments.css(".t-date").map { |date| date.text }.compact
      tier = tournaments.css(".info.ts").map { |tier| tier.text }.compact
      binding.pry
      Tournament.new(name, date, tier)
    end
  end





end
