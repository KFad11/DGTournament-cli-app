# frozen_string_literal: true

class EventScraper
  attr_accessor :about

  BASE_URL = "https://www.discgolfscene.com"

  def page
    @page ||= Nokogiri::HTML(open("#{BASE_URL}/tournaments/Pennsylvania"))
  end

  def scrape_tournaments
    page.css(".tournaments-listing-all").children.each do |tournament|
      next if tournament.attr("style") == "text-align: center;"

      name = tournament.css("em").map { |t_name| t_name.text.strip }.first
      date = tournament.css(".t-date").map { |t_date| t_date.text.strip }.first
      tier = tournament.css(".info.ts").map { |t_tier| t_tier.text.strip }.first
      tier = "Unsanctioned" if tier == ""
      url = BASE_URL + tournament.css("a").first["href"]
      @tourney = Tournament.new(name, date, tier, about, url)
    end
  end

  def scrape_tournament_info(tournament)
    info = Nokogiri::HTML(open(tournament.url))
    info.css(".maincontent").each do |about_info|
      binding.pry
      about.description = about_info.css(".tournament-about").map { |t_about| t_about.text.strip }.first
    end
  end
end
