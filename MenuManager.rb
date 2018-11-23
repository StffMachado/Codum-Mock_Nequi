require_relative 'Menu'

class MenuManager

  def initialize
    @menus = {}
    @menus[:login] = Menu.new('Mock Nequi', ['Iniciar sesión','Registrar nuevo usuario', 'Salir'])
  end

  def menu(menu_name)
    return @menus[menu_name]
  end
end
