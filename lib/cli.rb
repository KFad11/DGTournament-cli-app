class Cli
  def call
    puts "Hello World!"
    EventScraper.run!
    puts Tournament.all.first.title
  end
end
