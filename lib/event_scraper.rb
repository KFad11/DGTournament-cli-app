class EventScraper

  def self.run!
    page = Nokogiri::whatever.opne("https://whateve.com")
    page.grab_big_div.each do |tournamnet_html|
      date = tournament_html.css("whatever") # returns a nokogiri array obj -- can call array methods on it
      title = tournament_html.css()
      Tournament.new(date, title)
    end
  end
end
