# frozen_string_literal: true

class EventScraper
  BASE_URL = "https://www.discgolfscene.com"

  def page
    @page ||= Nokogiri::HTML(open("#{BASE_URL}/tournaments/Pennsylvania"))
  end

  def scrape_tournaments
    page.css(".tournaments-listing-all").children.each do |tournament|
      next if tournament.attr("style") == "text-align: center;"

      url = BASE_URL + tournament.css("a").first["href"]
      Tournament.new(get_name(tournament), get_date(tournament), get_tier(tournament), url)
    end
  end

  def get_name(tournament)
    get_info(tournament, "em")
  end

  def get_date(tournament)
    get_info(tournament, ".t-date")
  end

  def get_tier(tournament)
    tier = get_info(tournament, ".info.ts")
    if tier == ""
      "Unsanctioned"
    else
      tier
    end
  end

  def get_info(tournament, selector)
    tournament.css(selector).map { |element| element.text.strip }.first
  end

  def scrape_tournament_info(tourney)
    tourney_page = Nokogiri::HTML(open(tourney.url))
    tourney.info = tourney_page.css(".tournament-about").text
  end
end
