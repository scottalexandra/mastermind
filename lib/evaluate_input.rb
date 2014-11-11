class EvaluateInput
  attr_reader :input, :eval_input

  def initialize(input)
    @input = user_input.downcase!
    @eval_input = []
  end

  def convert_to_array
    @eval_input = user_input.split(//)
  end

  def finished?
    @user_input == 'q' || @user_input =='quit'
  end

  def exit?
    @user_input == "q" || "quit"
  end

  #def input_is_valid?
   #eval_input.each {|char| char == (/^r|g|b|y$/)}
  #end

  def input_is_valid?
    eval_input.all? {|char| char == "r" || char == "b" || char == "y" || char == "g" }
  end

  def play?
    @user_input == "p" || "play"
  end

  def instructions?
    @user_input == "i" || "instructions"
  end
end
