require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def
    get_page
    site = "https://www.imdb.com/list/ls062031974/"
    html = open(site)
    page = Nokogiri::HTML(html)
    #binding.pry
  end

  def get_movies
    self.get_page.css(".lister-item.mode-detail")
    #binding.pry
  end

  def make_movies
    self.get_movies.each do |movie|
        binding.pry
      anime = Anime.new
      anime.title = (".lister-item-content").css(".lister-item-header").css("a").text
    end
  end

  def print_movies
    self.make_movies
    Anime.all.each do |movie|
      puts "title: #{movie.title}"
    end
  end


end


=begin
  def print_movies
    self.make_movies
    Movie.all.each do |movie|
        puts "Rank: #{movie.rank}"
        puts "title: #{movie.title}"
        puts "Release Year: #{movie.release_year}"
        puts "Rating: #{movie.rating}"
        puts "Genre: #{movie.genre}"
        puts "Runtime: #{movie.runtime}"
        puts "Synopsis: #{movie.synopsis}"
        puts "Director: #{movie.director}"
    end
  end
=end

#title = page.css(".lister-item.mode-detail[3]").css(".lister-item-content").css(".lister-item-header").css("a").text

#rank = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".lister-item-header").css(".lister-item-index.unbold.text-primary").text

#release_year = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".lister-item-header").css(".lister-item-year.text-muted.unbold").text

#movie_rating = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".certificate").text

#genre = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".genre").text

#runtime = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".runtime").text


#synopsis = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css("p[4]").text

#director = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css("a[1]").text.strip
