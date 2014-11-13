# take two arrays:
#test that input is array with 4 characters
#compare input
#provide feedback about number of color matches in guess compared to secret code
#provide feedback about number of position and color matches in guess compared to secret
class CompareCodes
  attr_reader :code,
              :guess

  def initialize(secret_code, evaluated_input)
    @code = secret_code
    @guess = evaluated_input
    @counter = 0
  end



  def match?
    #puts "this is code #{@code} and this is guess #{@guess}"
    @code == @guess
  end

  def winner?
    match?
  end

  def position_color_match
    correct_position = @guess.each_with_index.count {|color,position| color == @code[position]}
    correct_position
  end

  def color_match
    copy = @code.dup
    @guess.each do |matching_character|
      if copy.include?(matching_character)
        @counter += 1
        copy.delete_at(copy.index(matching_character))
      end
    end
    @counter
    #puts "you have #{@counter} of the colors in the correct position"
  end
end
