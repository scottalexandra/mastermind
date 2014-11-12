class EvaluateInput
  attr_reader :input,
              :eval_input

  def initialize(input)
    @input = input.downcase
    @eval_input = []
  end

  def convert_to_array
    @eval_input = input.split(//)
  end

  def finished?
    @input == 'q' || @input =='quit'
  end

  def exit?
    @input == "q" || @input == "quit"
  end

  #def input_is_valid?
   #eval_input.each {|char| char == (/^r|g|b|y$/)}
  #end

  def input_is_valid?
    @eval_input = input.split(//)
    eval_input.all? {|char| char == "r" || char == "b" || char == "y" || char == "g" }
  end

  def play?
    @input == "p" || @input == "play"
  end

  def instructions?
    @input == "i" || @input == "instructions"
  end
end
