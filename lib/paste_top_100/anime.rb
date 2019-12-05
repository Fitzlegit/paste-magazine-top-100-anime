require 'Nokogiri'
require 'open-uri'
require 'pry'

require_relative './anime.rb'


class PasteTop100::Anime

  attr_accessor :rank, :title, :release_date, :synopsis, :director, :gross_earnings, :movie_rating, :runtime, :genre

  @@all = [] #=> stores all movie objects into an array

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def get_page
    doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls062031974/"))
    binding.pry
  end







end

Scraper.new.get_page
