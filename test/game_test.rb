gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'


class GameTest < Minitest::Test
  def test_that_menu_is_displayed
    game = Game.new
    assert_equal "To Play Enter [p], For Instructions Enter [i], To Quit Enter [q]", game.display_menu
  end

  def test_that_when_p_is_entered_a_secret_code_is_generated
    game = Game.new
    code = game.accept_menu_input("p")
    assert code.is_a?(Array)
  end
end
