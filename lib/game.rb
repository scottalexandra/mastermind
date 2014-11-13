require_relative 'code_generator'
require_relative 'messages'
require_relative 'evaluate_input'
require_relative 'compare_codes'

class Game
  attr_accessor :new_secret_code,
                :instream,
                :outstream,
                :messages,
                :user_input,
                :eval_input

  attr_reader   :code

  def initialize(instream, outstream)
    self.instream = instream
    self.outstream = outstream
    self.user_input = ""
    @messages = Messages.new
    @new_secret_code = CodeGenerator.new
    @code = []
    @won = false
    @done = false
  end

  def generate_secret_code
    @code = new_secret_code.secret_code
    #puts "#{@code}"
  end


  def play
    outstream.puts messages.game_intro
    generate_secret_code
    until won? || done?
      outstream.puts messages.game_command_request
      @user_input = instream.gets.strip
      eval_input = EvaluateInput.new(@user_input)
      #@guess = eval_input.input
      #puts "this is the #{@guess}"
      break if user_input == "q" || user_input == "quit"
      process_game_commands(eval_input)
    end
  end

  def process_game_commands(eval_input)
    if eval_input.input_is_valid?
      compare_codes(eval_input)
    else
      outstream.puts messages.not_valid_input
    end
  end

  def compare_codes(eval_input)
    guess_code = eval_input.convert_to_array
    guess = CompareCodes.new(@code, guess_code)

    #if done?
      #@done = true

    if guess.match?
      outstream.puts messages.winner
      outstream.puts messages.program_instructions
      @won = true

      #outstream.puts messages.command_request
    else
      outstream.puts messages.no_match
      puts "you have #{guess.color_match} of the correct colors"
      puts "you have #{guess.position_color_match} colors in the correct position"
    end
  end

  def won?
    @won
  end

  #def done?
    #user_input == "q" || user_input == "quit"
    #@done
  #end

  def exit?
    user_input == "q" || user_input == "quit"
  end
end
