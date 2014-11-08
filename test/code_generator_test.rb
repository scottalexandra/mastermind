gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/code_generator'

class CodeGeneratorTest < Minitest::Test
  def test_that_code_generator_generates_an_array
    code_generator = CodeGenerator.new
    assert_equal ['R','R','R','R','G','G','G','G','B','B','B','B','Y','Y','Y','Y'], code_generator.array
  end

  def test_that_new_code_starts_with_an_empty_array
  code_generator = CodeGenerator.new
  assert_equal [], code_generator.new_code
  end

  def test_that_a_new_array_is_generated_with_4_letters

    code_generator = CodeGenerator.new
    assert_equal 4, code_generator.secret_code.length
  end

end
