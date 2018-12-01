class MattressMenuController

  def self.start
    process_option(MenuManager.menu(:mattress).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      Balance.show_balance([Session.user.get_fund(FundType.type(:mattress))])
    when 2
      Transfer.transfer(Session.user.get_fund(FundType.type(:account)), Session.user.get_fund(FundType.type(:mattress)), 'Agregar dinero a colchón')
      #Falta tomar el valor retornado por transfer y dar un mensaje de éxito/fallo
    when 3
      Transfer.transfer(Session.user.get_fund(FundType.type(:mattress)), Session.user.get_fund(FundType.type(:account)), 'Retirar dinero del colchón')
      #Falta tomar el valor retornado por transfer y dar un mensaje de éxito/fallo
    when 4
      MainMenuController.start
    end
  end

end
