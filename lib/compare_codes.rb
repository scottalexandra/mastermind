# take two arrays:
#test that input is array with 4 characters
#compare input
#provide feedback about number of color matches in guess compared to secret code
#provide feedback about number of position and color matches in guess compared to secret
class CompareCodes
  attr_reader :secret_code, :guess

  def initialize(secret_code, guess)
    @secret_code = secret_code
    @guess = guess
    @counter = 0
  end


  def match?
    @secret_code == @guess
  end

  def position_color_match
    @guess.each_with_index.count {|color,position| color == @secret_code[position]}
  end

  def color_match
    copy = @secret_code.dup
    @guess.each do |color|
      if copy.include?(color)
        @counter += 1
        copy.delete_at(copy.index(color))
      end
    end
    @counter
  end
end
