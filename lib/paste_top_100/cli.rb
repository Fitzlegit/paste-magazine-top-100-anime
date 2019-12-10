class CLI
  #runs the CLI interface methods
  def run
    puts "Welcome to Paste Magazine top anime movies"
    #calls scraper class to create movie objects
    Scraper.make_movies
    display_titles
    ask_for_movie_choice
  end

  #prompts user for a movie choice
  def ask_for_movie_choice
    puts "Choose a number between 1-10 to select a movie"
    #get user input
    input = gets.chomp.to_i
    until valid_input?(input)
      puts "Sorry, that's not a valid choice - choose 1-10"
      input = gets.chomp.to_i
    end

    puts "Great pick, let's check out some more information!"
    puts "-------------------------------------------------------->"
    storyline(input)
  end

  #prompts user to  go back and view more or quit the cli
  def view_another?
    yesno = gets.chomp.to_s
    if yesno == "yes"
      display_titles
      ask_for_movie_choice
    elsif yesno == "no"
      puts "Thanks for using paste top anime movies CLI, come back soon!"
    else
      puts "please put in a valid answer of yes or no"
      view_another?
    end
  end

  #method call scraper to dig one level deeper and return infomation
  def storyline(input)
    anime = Anime.all[input -1]
    Scraper.scrape_storyline(anime)
    puts "\n#{anime.title}, #{anime.release_date} | Rated: #{anime.rating} | Runtime: #{anime.runtime} | Genre: #{anime.genre} \n "
    puts anime.story
    puts "\nDirector: #{anime.director}"
    sleep(5)
    puts "\nWould you like to view another selection (yes/no)"
    view_another?
  end

  #checks to make sure user input is between the movie selection
  def valid_input?(input)
    input.between?(1,Anime.all.size)
    #input <= 1  &&  >= 10
  end

  #prints the titles of the first 10 movies and uses :rank key to list the order
  def display_titles
    Anime.all.each do |movie|
      puts "#{movie.rank} - #{movie.title}"
      puts "--------------------------------"
    end
  end
end
