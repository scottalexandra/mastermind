gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require_relative '../lib/messages'

class CliTest < Minitest::Test
  def test_cli_is_initialized_with_two_arguments
    cli = Cli.new("bob", "fred")
    assert_equal "bob", cli.instream
    assert_equal "fred", cli.outstream
  end

  def test_call_method_exists
    cli = Cli.new("bob", "fred")
    assert cli.respond_to?(:call), "cannot find call method"
  end

  def test_intro_message_is_displayed
    cli = Cli.new("instream", "outstream")
    assert_equal "Welcome to Mastermind.", cli.call
  end

  def test_user_input_is_stripped
    instream = StringIO.new("   instream/t/t")
    cli = Cli.new(instream, "outstream")
    cli.call
    assert_equal "instream", cli.user_input
  end


end
