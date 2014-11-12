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
    @user_input = ""
    #@eval_input = ""
    @messages = Messages.new
    @new_secret_code = CodeGenerator.new
    @code = []
  end

  def generate_secret_code
    @code = new_secret_code.secret_code
    puts "#{@code}"
  end


  def play
    outstream.puts messages.game_intro
    generate_secret_code
    loop do
      outstream.puts messages.game_command_request
      @user_input = instream.gets.strip
      eval_input = EvaluateInput.new(@user_input)
      break if eval_input.exit?
      process_game_commands(eval_input)
    end
  end

  def process_game_commands(eval_input)
    if eval_input.input_is_valid?
      compare_codes(eval_input)
    else
      outstream.puts messages.not_valid_input
      #outstream.puts messages.game_command_request
    end
  end

  def compare_codes(eval_input)
    eval_input.convert_to_array
    guess = CompareCodes.new(@code, eval_input)
    if guess.match?
      outstream.puts messages.winner
      outstream.puts messages.program_instructions
      outstream.puts messages.command_request
    else
      puts "not a match"
    end
  end
end
