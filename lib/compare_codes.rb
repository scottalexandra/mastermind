# take two arrays:
#test that input is array with 4 characters
#compare input
#provide feedback about number of color matches in guess compared to secret code
#provide feedback about number of position and color matches in guess compared to secret
class CompareCodes
  attr_reader :code,
              :guess

  def initialize(code, guess)
    @code = code
    @guess = guess
    @counter = 0
  end



  def match?
    @code == @guess
  end

  def position_color_match
    count = @guess.each_with_index.count {|color,position| color == @code[position]}
    puts "you have #{count} of the correct colors"
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
    puts "you have #{@counter} of the colors in the correct position"
  end
end
