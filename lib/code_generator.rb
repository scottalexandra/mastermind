#generates a random code of 4 characters

class CodeGenerator
  attr_reader :array, :new_code

  def initialize
    @array = ['r','r','r','r','g','g','g','g','b','b','b','b','y','y','y','y']
    @new_code = []
  end

  def secret_code
    @new_code = @array.shuffle!.pop(4) #could use shift instead of pop?
  end
end
