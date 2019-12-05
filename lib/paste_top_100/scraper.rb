require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def self.get_page
    page = Nokogiri::HTML(open("https://www.imdb.com/list/ls062031974/"))
    binding.pry
  end
end
