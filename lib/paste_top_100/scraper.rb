class Scraper
  def self.get_page
    site = "https://www.imdb.com/list/ls062031974/"
    html = open(site)
    page = Nokogiri::HTML(html)
    #binding.pry
  end

  def self.get_movies
    self.get_page.css(".lister-item.mode-detail")
    #binding.pry
  end

  def self.make_movies
    homepage = "https://www.imdb.com"
    self.get_movies.take(10).each do |movie|
      anime = Anime.new
      anime.rank = movie.css(".lister-item-content").css(".lister-item-header").css(".lister-item-index.unbold.text-primary").text.strip
      anime.title = movie.css(".lister-item-content").css(".lister-item-header").css("a").text.strip
      anime.release_date = movie.css(".lister-item-content").css(".lister-item-header").css(".lister-item-year.text-muted.unbold").text.strip
      anime.rating = movie.css(".lister-item-content").css(".text-muted.text-small").css(".certificate").text.strip
      anime.genre = movie.css(".lister-item-content").css(".text-muted.text-small").css(".genre").text.strip
      anime.runtime = movie.css(".lister-item-content").css(".text-muted.text-small").css(".runtime").text.strip
      anime.synopsis = movie.css(".lister-item-content").css("p")[1].text.strip
      anime.director = movie.css(".lister-item-content").css(".text-muted.text-small").css("a[1]").text.strip
      anime.link = homepage + movie.css(".lister-item-content").css(".lister-item-header").css("a")[0]["href"]
    end
  end

  def self.scrape_storyline(anime_obj)
    html = open(anime_obj.link)
    page = Nokogiri::HTML(html)
    anime_obj.story = page.css("#titleStoryLine div:nth-child(3) p span").text.strip
  end

  def print_movies
    self.make_movies
    Anime.all.each do |movie|
      puts "Rank: #{movie.rank}"
      puts "title: #{movie.title}"
      puts "Release Date: #{movie.release_date}"
      puts "Rating: #{movie.rating}"
      puts "Genre: #{movie.genre}"
      puts "Runtime: #{movie.runtime}"
      puts "Synopsis: #{movie.synopsis}"
      puts "Director: #{movie.director}"
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

#title = movie.css(".lister-item-content").css(".lister-item-header").css("a")[0]["href"]

#rank = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".lister-item-header").css(".lister-item-index.unbold.text-primary").text

#release_year = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".lister-item-header").css(".lister-item-year.text-muted.unbold").text

#movie_rating = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".certificate").text

#genre = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".genre").text

#runtime = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css(".runtime").text


#synopsis = movie.css(".lister-item-content").css("p")[2]

#director = page.css(".lister-item.mode-detail").first.css(".lister-item-content").css(".text-muted.text-small").css("a[1]").text.strip

#link = movie.css(".lister-item-content").css(".lister-item-header").css("a")[0]["href"]
