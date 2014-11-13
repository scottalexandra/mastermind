require_relative 'messages'

class EvaluateInput
  attr_accessor :input,
                :eval_input

  def initialize(input)
    @input = input.downcase
    @eval_input = []
    @valid = false
  end

  #def convert_to_array
  #   eval_input = input.split(//)
  # end

  def finished?
    input == 'q' || input =='quit'
  end

  def exit?
    input == "q" || input == "quit"
    #puts "press q to exit game"

  end


  def input_is_valid?
    eval_input = input.split(//)
    eval_input.all? {|char| char == "r" || char == "b" || char == "y" || char == "g" }
  end

  def length_short?
    #eval_input = input.split(//)
    input_is_valid? && input.split(//).length < 4
  end

  def length_long?
    #eval_input = input.split(//)
    input_is_valid? && input.split(//).length > 4
  end

  def play?
    input == "p" || input == "play"
  end

  def instructions?
    input == "i" || input == "instructions"
  end
end
