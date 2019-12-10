class Anime
  attr_accessor :rank, :title, :release_date, :synopsis, :director, :rating, :runtime, :genre, :link, :story


  @@all = [] #=> stores all movie objects into an array

  def initialize
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
