class CLI
  def run
    puts "Welcome to Paste Magazine top anime movies"


  end

  def ask_for_movie_choice
    puts "Choose a number between 1-10 to select a movie"
    #get user input
    input = gets.chomp.to_i
  until valid_input?(input)
    puts "Sorry, that's not a valid choice - choose 1-10"
    input = get.chomp.to_i
  end

  def valid_input?(input)
    input.between?(1,10)
    #input <= 1  &&  >= 10
  end

  def display_info
  end



end
