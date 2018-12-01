require_relative 'Table'

class Balance

  def self.show_balance(funds, description = 'Saldo Disponible')
    data = []
    funds.each do |fund|
      data << {'Fondo' => fund.name, 'Saldo' => fund.balance}
    end
    Table.new(description, data).show
    Error.alert('')
  end

  def self.show_total_balance(user)
    balance = user.all_funds.map{|fund| fund.balance}.sum
    data = [{'Fondo':'Cuenta de ahorros', 'Saldo total':balance}]
    Table.new('Saldo Total', data).show
    Error.alert('')
  end

end
