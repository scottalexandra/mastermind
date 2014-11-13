require_relative 'compare_codes'
require 'colorize'

class Messages

  def intro
    "Welcome to Mastermind. " + program_instructions
  end

  def program_instructions
    "To Play Enter '(p)lay', For Instructions Enter '(i)nstructions', To Quit At Anytime Enter '(q)uit' "
  end

  def command_request
    "MAIN MENU: Enter a command[(q)uit, (i)nstructions, or (p)play] : "
  end

  def game_instructions
  puts "Once the game begins, a secret code will be generated consisting of 4 elements, "\

       "#{red}, #{yellow}, #{green}, #{blue}. This code will be hidden from you."\
       " Your task is to guess the code in the least number of trys.\nAlong the way,"\
       "you will be given hints about the code, until you guess the correct code.\n"\
       "Guess wisely, he who has the least amount of guesses wins!\n The code consists of 4 elements: "
  end

  def red
    "(r)ed".red
  end

  def duration(minutes, seconds, tries)
    "It took you #{tries} tries over #{minutes} minutes and #{seconds} seconds to finish."
  end

  def color_match(color_match)
   "You have #{color_match} of the correct #{colors}"
  end

  def position_color_match(position_color_match)
    puts "you have #{position_color_match} #{colors} in the correct position"
  end

  def colors
    "c".red + "o".yellow + "l".blue + "o".green + "r".red + "(s)".yellow
  end

  def yellow
    "(y)ellow".yellow
  end

  def green
    "(g)reen".green
  end

  def blue
    "(b)lue".blue
  end

  def ending
    "Good bye."
  end

  def game_intro
    "I have generated a beginner sequence with four elements made up of:"\
    "#{red},#{green}, #{blue}, and #{yellow}."
  end

  def game_command_request
    "Enter colors (or 'q' for quit):"
  end

  def try_indicator(tries)
    "This is try number #{tries}"
  end

  def quit_game
    "Exiting game" +
    program_instructions
  end

  def not_valid_input
    "Input not valid. Please enter (r)ed, (g)reen, (b)lue, or (y)ellow"
  end

  def winner
    puts"YOU".red + " WON".blue + "!!!".green + "!!!".yellow
  end

  def no_match
    "not a match"
  end

  def too_short
    "The code you entered is too short."
  end

  def too_long
    "The code you entered is too long."
  end

end
