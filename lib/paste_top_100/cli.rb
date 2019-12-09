class CLI
  def run
    puts "Welcome to Paste Magazine top anime movies"
    Scraper.make_movies
    display_titles
    ask_for_movie_choice
    #display info of title choice
  end

  def ask_for_movie_choice
    puts "Choose a number between 1-10 to select a movie"
    #get user input
    input = gets.chomp.to_i
    until valid_input?(input)
      puts "Sorry, that's not a valid choice - choose 1-10"
      input = gets.chomp.to_i
    end
  end

  def more_movie_info(input)


  end

  def valid_input?(input)
    input.between?(1,Anime.all.size)
    #input <= 1  &&  >= 10
  end

  def display_titles
    Anime.all.each do |movie|
      puts "#{movie.rank} - #{movie.title}"
      puts "--------------------------------"
    end
  end
end
