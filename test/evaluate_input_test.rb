gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluate_input'

class EvaluateInputTest < Minitest::Test

  def test_user_input_is_downcased
    user_input = EvaluateInput.new("RRGB")
    assert_equal "rrgb", user_input.user_input
  end

  def test_user_input_is_an_array
    user_input = EvaluateInput.new("RRGB")
    assert_equal ['r','r','g','b'], user_input.convert_to_array
  end

  def test_exit_method_exists
    user_input = EvaluateInput.new("RRGB")
    assert user_input.respond_to?(:exit?)
  end

  def test_input_is_valid_method_exists
    user_input = EvaluateInput.new("RRGB")
    assert user_input.respond_to?(:input_is_valid?)
  end

  def test_input_not_valid
    guess = EvaluateInput.new("GRYB")
    guess.convert_to_array
    assert guess.input_is_valid?, "see's user input as not valid"
  end
end
