require_relative 'EntryMenuController'
require_relative 'MainMenuController'
require_relative 'User'
require_relative 'Form'
require_relative 'Session'
require_relative 'Error'

class Login

  def self.start
    credentials = Form.new('Iniciar sesión', {'E-mail' => :email, 'Contraseña' => :string}).ask
    user = User.fetch_from_db(credentials['E-mail'], credentials['Contraseña'])
    if user.nil?
      Error.alert('Credenciales no válidas.')
      EntryMenuController.start
    else
      Session.user = user
      MainMenuController.start
    end
  end

end
