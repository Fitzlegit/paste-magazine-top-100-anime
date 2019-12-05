require 'nokogiri'
require 'open-uri'
require 'pry'

class PasteTop100::Anime

  attr_accessor :rank, :title, :release_date, :synopsis, :director, :gross_earnings, :movie_rating, :runtime, :genre

  @@all = [] #=> stores all movie objects into an array

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end

Scraper.new.get_page
