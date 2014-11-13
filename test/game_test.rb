gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_new_game_outputs_welcome_message_when_played
    skip
    input = StringIO.new
    input.puts("p")
    input.puts("yyyy")
    input.rewind

    output = StringIO.new

    new_game = Game.new(input, output)
    new_game.play
    output.rewind
    game_output = output.read
    assert_equal(game_output, Messages.new.intro)
  end

  def test_new_game_will_generate_code
    input = StringIO.new
    output = StringIO.new
    new_game = Game.new(input, output)
    assert new_game.respond_to?(:generate_secret_code)
  end

  def test_new_secret_code_is_an_array
    new_game = Game.new("p", "")
    assert new_game.generate_secret_code.is_a?(Array)
  end

  def test_evaluate_guess_from_player
    new_game = Game.new("rryb", "")
    assert new_game.respond_to?(:process_game_commands)
  end

  def test_player_input_is_evaluated
    new_game = Game.new("rryb", "")
    new_game.play
    assert new_game.process_game_commands("rryb").is_a?(Array)
  end
end
