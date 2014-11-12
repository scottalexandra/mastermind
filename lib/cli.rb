require_relative 'messages'
require_relative 'evaluate_input'
require_relative 'game'


class Cli
  attr_reader :user_input,
              :messages,
              :instream,
              :outstream,
              :eval_input

  def initialize(instream, outstream)
    @user_input   = ""
    @messages     = Messages.new
    @instream     = instream
    @outstream    = outstream
  end

  def call
    @outstream.puts messages.intro

    loop do
      @outstream.puts messages.command_request
      user_input = instream.gets.strip
      eval_input = EvaluateInput.new(user_input)
      break if eval_input.finished?
      process_initial_commands(eval_input)
    end
    outstream.puts messages.ending
  end

  private

  def process_initial_commands(eval_input)
    if eval_input.exit?
      outstream.puts messages.quit_game
    elsif eval_input.play?
      game = Game.new(instream, outstream)
      game.play
    elsif eval_input.instructions?
      outstream.puts messages.game_instructions
    else
      outstream.puts messages.not_valid_input
    end
  end



end

Cli.new($stdin, $stdout).call
#when eval_input.!input_is_valid?
  #outstream.puts messages.not_valid_input
