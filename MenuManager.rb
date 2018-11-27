require_relative 'Menu'
require_relative 'Form'

class MenuManager

  def initialize
    @menus = {}
    @menus[:login] = Menu.new('Mock Nequi', ['Iniciar sesión','Registrar nuevo usuario', 'Salir'])
    @menus[:account] = Menu.new('Cuenta de Ahorros', ['Consultar saldo disponible','Consultar saldo total', '...'])

  end

  def menu(menu_name)
    return @menus[menu_name]

  end

  def menu_principal
    puts "-------------------------Bienvenido a Mock Nequi------------------------- \n
      (Indique el numero de la opción deseada para comenzar): \n
      1. Iniciar Sesion
      2. Registrar nuevo usuario
      3. Salir
      "
    

      n = gets.chomp.to_i
      case n
      when 1
         puts 'Opcion 1'
          #get_numbers do |x,y|
          #puts "Sum: #{sum(x,y)}"
          #end
      when 2
        data = {'username' => :string, 'name' => :string, 'e-mail' => :email, 'password' => :string}
        form = Form.new('Registro', data)
        response = form.ask(:username)

      when 3
        puts 'Gracias por visitarnos'
      else
        puts "Solo indique numeros (1, 2 o 3)"
        self.menu_principal()

  end
end

end
