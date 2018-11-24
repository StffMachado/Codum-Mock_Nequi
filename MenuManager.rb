require_relative 'Menu'

class MenuManager

  def initialize
    @menus = {}
    @menus[:login] = Menu.new('Mock Nequi', ['Iniciar sesión','Registrar nuevo usuario', 'Salir'])
    @menus[:account] = Menu.new('Cuenta de Ahorros', ['Consultar saldo disponible','Consultar saldo total', '...'])
  end

  def menu(menu_name)
    return @menus[menu_name]
  end
end
