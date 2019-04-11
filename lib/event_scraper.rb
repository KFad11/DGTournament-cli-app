# handles scraping and likely creating tournament and other objs. Never "puts"
class EventScraper
  def page
    @page ||= Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
  end

  def make_tournaments
    page.css(".tournaments-listing-all").children.each do |tournament|
      next if tournament.attr('style') == "text-align: center;"
      name = tournament.css("em").map { |name| name.text.strip }
      date = tournament.css(".t-date").map { |date| date.text.strip }
      tier = tournament.css(".info.ts").map { |tier| tier.text.strip }
      tourney = Tournament.new(name, date, tier)
    end
  end

end
