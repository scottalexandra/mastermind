#compares two codes
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/compare_codes'

class CompareCodesTest < Minitest::Test

  def test_codes_entered_are_arrays
    secret_code = ['R','R','G','Y']
    guess = ['G','R','B','Y']
    new_comparison = CompareCodes.new(secret_code, guess)
    assert new_comparison.secret_code.is_a?(Array)
    assert new_comparison.guess.is_a?(Array)
  end

  def test_codes_entered_are_four_characters_long

    secret_code = ['R','R','G','Y']
    guess = ['G','R','B','Y']
    new_comparison = CompareCodes.new(secret_code, guess)
    assert_equal 4, new_comparison.secret_code.length
    assert_equal 4, new_comparison.guess.length
  end

  def test_to_see_if_codes_match

    secret_code = ['R','R','G','Y']
    guess = ['G','R','B','Y']
    new_comparison = CompareCodes.new(secret_code, guess)
    refute new_comparison.match?, '.match? method is returing true'
  end

  def test_to_see_if_number_of_matching_characters_is_returned

    secret_code = ['R','B','G','Y']
    guess = ['G','R','B','Y']
    new_comparison = CompareCodes.new(secret_code, guess)
    assert_equal 1, new_comparison.position_color_match
  end

  def test_to_see_if_how_many_colors_are_correct
    
    secret_code = ['R','R','G','Y']
    guess = ['G','R','B','Y']
    new_comparison = CompareCodes.new(secret_code, guess)
    assert_equal 3, new_comparison.color_match
  end
end
