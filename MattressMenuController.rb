require_relative 'Balance'
require_relative 'Transfer'
require_relative 'Error'

class MattressMenuController

  def self.start
    process_option(MenuManager.menu(:mattress).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      Balance.show_balance([Session.user.get_fund(FundType.type(:mattress))])
    when 2
      Error.alert(Transfer.transfer(Session.user.get_fund(FundType.type(:account)), Session.user.get_fund(FundType.type(:mattress)), 'Depósito a colchón') ? 'Transacción exitosa.' : 'Error durante la transacción.')
    when 3
      Error.alert(Transfer.transfer(Session.user.get_fund(FundType.type(:mattress)), Session.user.get_fund(FundType.type(:account)), 'Retiro de colchón') ? 'Transacción exitosa.' : 'Error durante la transacción.')
    when 4
      MainMenuController.start
    end
    MattressMenuController.start unless opt == 4
  end

end
