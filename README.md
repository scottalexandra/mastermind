Mastermind!!!
Guess the code (a combination of red, green, yellow, and blue) that the computer generates in the least amount of turns.

Game features:
ASCII art
color
timer
number of turns



Algorithm

Start Game
Display Menu >>> Play, Instructions, Quit
  if Play is selected
    Generate a secret code
    Prompt player for first guess
    Check that input is valid (correct number of characters,          case sensitive..etc)
    Evaluate move to see if it matches the secret code
      if it matches - display winner and prompt player to quit or play again
      if it doesn't match - giver player clues (right colors, right positions...etc)
        prompt player for next guess
        evaluate input... repeat until player matches secret code

  if instructions are selected
    display instructions
    prompt player to play game

  if quit is selected
    quit game
