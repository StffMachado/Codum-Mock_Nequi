require_relative 'Menu'
require_relative 'Session'

class MenuManager

  def self.create_menus
    @@menus = {}
    @@menus[:entry] = Menu.new('Mock Nequi', ['Iniciar sesión','Registrar nuevo usuario', 'Salir'])
    @@menus[:main] = Menu.new('Menu principal', ['Administrar Cuenta','Administrar Colchón','Administrar Bolsillos','Administrar Metas','Últimas transferencias','Cerrar sesión'])
    @@menus[:account] = Menu.new('Cuenta', ['Consultar el saldo disponible','Consultar el saldo total','Hacer un depósito','Hacer un retiro','Hacer una transferencia','Atrás'])
    @@menus[:mattress] = Menu.new('Colchón', ['Consultar el saldo','Traer dinero de la cuenta','Mover dinero a la cuenta','Atrás'])
    @@menus[:pocket] = Menu.new('Bolsillos', ['Listar los bolsillos','Crear nuevo bolsillo','Eliminar bolsillo','Traer dinero desde la cuenta','Mover dinero a la cuenta','Hacer una transferencia','Atrás'])
    @@menus[:goal] = Menu.new('Metas', ['Listar metas','Crear meta','Cerrar meta','Traer dinero desde la cuenta','Atrás'])
  end

  def self.menu(menu_name)
    return @@menus[menu_name]
  end
end
