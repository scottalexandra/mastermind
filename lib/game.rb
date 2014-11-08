require_relative 'code_generator'

class Game
  def initialize
    @new_code = CodeGenerator.new
  end


  def display_menu
    "To Play Enter [p], For Instructions Enter [i], To Quit Enter [q]"
  end

  def accept_menu_input(menu_selection)
    if menu_selection == "p"
      @new_code.secret_code
    end
  end

end
