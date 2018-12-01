require_relative 'EntryMenuController'
require_relative 'User'
require_relative 'Form'

class Signup

  def self.start
    data = Form.new('Registro', {'E-mail' => :email, 'Nombre' => :string, 'Apellido' => :string, 'Contraseña' => :string}).ask
    user = User.new(nil, data['Nombre'], data['Apellido'], data['E-mail'], data['Contraseña'])
    if user.create_in_db
      Error.alert("Usuario creado exitosamente.")
    else
      Error.alert("El correo electrónico #{user.email} ya está registrado.")
    end
    EntryMenuController.start
  end

end
