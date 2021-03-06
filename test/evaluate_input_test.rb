gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluate_input'

class EvaluateInputTest < Minitest::Test

  def test_user_input_is_downcased
    user_input = EvaluateInput.new("Q")
    assert_equal "q", user_input.input
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

  def test_length_too_short
    guess = EvaluateInput.new("yyy")
    assert guess.length_short?
  end

  def test_length_too_long
    guess = EvaluateInput.new("GGY4B")
    refute guess.length_long?
  end
end
