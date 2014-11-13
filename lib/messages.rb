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
    "Once the game begins, a secret code will be generated with four colors consisting of red, yellow, green, and blue.\n
    This code will be hidden from you. Your task is to guess the code in the least number of trys.\n
    Along the way, you will be given hints about the position of each color, until you guess the correct code.\n
    Guess wisely, he who has the least amount of guesses wins! \n" #+ program_instructions
  end

  def ending
    "Good bye."
  end

  def game_intro
    "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow."#Use (q)uit at any time to end the game.

  end

  def game_command_request
    "Enter a code or command"#[(q)uit, (i)nstructions, or (p)play] :
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
    "you won!"
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
