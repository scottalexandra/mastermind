require_relative 'messages'
require_relative 'evaluate_input'


class Cli
  attr_reader :user_input, :messages, :instream, :outstream, :eval_input

  def initialize(instream, outstream)
    @user_input   = ""
    #@eval_input   = EvaluateInput.new(@user_input)
    @messages     = Messages.new
    @instream     = instream
    @outstream    = outstream
  end

  def call
    @outstream.puts messages.intro

    loop do
      @outstream.puts messages.command_request
      @user_input = instream.gets.strip
      eval_input = EvaluateInput.new(@user_input)
      break if eval_input.finished?
      process_initial_commands(eval_input)
    end
    outstream.puts messages.ending
  end

  private

  def process_initial_commands(eval_input)
    case
    when eval_input.exit?
      outstream.puts messages.quit_game
    when eval_input.play?
      puts "fake play game"
      # game = Game.new
      # game.play
    when eval_input.intructions?
      outstream.puts messages.game_instructions
    else
      outstream.puts messages.not_valid_input
    end

  end



end
#when eval_input.!input_is_valid?
  #outstream.puts messages.not_valid_input
