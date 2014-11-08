#generates a random code of 4 characters

class CodeGenerator
  attr_reader :array

  def initialize
    @array = ['R','R','R','R','G','G','G','G','B','B','B','B','Y','Y','Y','Y']
    @new_code = []
  end

  def secret_code
    @new_code = @array.shuffle!.pop(4)
  end
end
