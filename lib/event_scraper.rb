class EventScraper

  def self.run!
    doc = Nokogiri::HTML(open("https://www.discgolfscene.com/tournaments/Pennsylvania"))
    doc.css
    binding.pry
  end

end
