require_relative 'Form'

data = {'username' => :string, 'e-mail' => :email, 'password' => :string, 'edad' => :integer}
form = Form.new('Registro', data)
response = form.ask
