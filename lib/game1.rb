require_relative 'code_generator'
require_relative 'messages'
require_relative 'evaluate_input'
require_relative 'compare_codes'
require 'time_diff'


class Game1
  attr_accessor :instream,
                :outstream,
                :messages,
                :mastermind_code


  def initialize(instream, outstream, messages)
    self.instream = instream
    self.outstream = outstream
    self.messages = Messages.new
    self.mastermind_code = CodeGenerator.new
    @guess = 0
  end

  def generate_secret_code
    @secret_code = mastermind_code.secret_code
  end

  def play
    @start_time = Time.now
    generate_secret_code
    outstream.puts messages.game_intro
    until won?
      outstream.puts messages.game_command_request
      user_input = instream.gets.strip
      evaluated_input = EvaluateInput.new(user_input)
      break if user_input == "q" || user_input == "quit"
      process_game_commands(evaluated_input)
    end
  end

  def process_game_commands(evaluated_input)
    if evaluated_input.length_short?
      outstream.puts messages.too_short
    elsif evaluated_input.length_long?
      outstream.puts messages.too_long
    elsif evaluated_input.input_is_valid?
      compare_codes(evaluated_input)
    else
      outstream.puts messages.not_valid_input
    end
  end

  def compare_codes(evaluated_input)
    @guess += 1
    guess_code = evaluated_input.input.chars
    eval_guess = CompareCodes.new(@secret_code, guess_code)
    if eval_guess.match? == false
      outstream.puts messages.no_match
      outstream.puts messages.color_match(eval_guess.color_match)
      outstream.puts messages.position_color_match(eval_guess.position_color_match)
    elsif eval_guess.match?
      duration = Time.diff(@start_time, Time.now)
      outstream.puts messages.winner
      outstream.puts messages.duration(duration[:minute], duration[:second], @guess)
      outstream.puts messages.program_instructions
      @won = true
    end
  end

  def won?
    @won
  end
end
