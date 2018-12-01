require_relative 'Balance'
require_relative 'Transfer'
require_relative 'Error'

class AccountMenuController

  def self.start
    process_option(MenuManager.menu(:account).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      Balance.show_balance([Session.user.get_fund(FundType.type(:account))])
    when 2
      Balance.show_total_balance(Session.user)
    when 3
      Error.alert(Transfer.transfer(nil, Session.user.get_fund(FundType.type(:account)), 'Depósito a cuenta') ? 'Transacción exitosa.' : 'Error durante la transacción.')
    when 4
      Error.alert(Transfer.transfer(Session.user.get_fund(FundType.type(:account)), nil, 'Retiro de cuenta') ? 'Transacción exitosa.' : 'Error durante la transacción.')
    when 5
      Error.alert(Transfer.inter_user_transfer(Session.user.get_fund(FundType.type(:account)), 'Transferencia a otro usuario') ? 'Transacción exitosa.' : 'Error durante la transacción.')
    when 6
      MainMenuController.start
    end
    AccountMenuController.start unless opt == 6
  end

end
