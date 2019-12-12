class Director
  attr_accessor :name

  @@all = []

  def initialize
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def movies
    Anime.all.select {|movie| movie.director == self }
  end

  def self.find_or_create_by_name(director_name)
    # iterate through array of directors for our args
    result = self.all.find {|director| director.name == director_name }
    if result
      result
    else
      director = Director.new
      director.name = director_name
      director
    end
    # if found return director from array
    # if not create new director
  end

end
