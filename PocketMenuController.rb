class PocketMenuController

  def self.start
    process_option(MenuManager.menu(:pocket).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      Balance.show_balance(Session.user.funds_of_type(FundType.type(:pocket)))
    when 2
      Error.alert(Session.user.open_fund(Form.new('Nuevo bolsillo', {'Nombre' => :string}).ask['Nombre'], FundType.type(:pocket)) ? 'Bolsillo creado exitosamente.' : 'El bolsillo ya existe.')
  when 3
      Error.alert(Session.user.close_fund(Form.new('Eliminar bolsillo', {'Nombre' => :string}).ask['Nombre'], FundType.type(:pocket)) ? 'Bolsillo eliminado.' : 'El bolsillo no existe.')
    when 4
      pocket = Session.user.get_fund(FundType.type(:pocket), Form.new('Seleccionar bolsillo', {'Nombre' => :string}).ask['Nombre'])
      if pocket.nil?
        Error.alert('El bolsillo no existe.')
      else
        Error.alert(Transfer.transfer(Session.user.get_fund(FundType.type(:account)), pocket, 'Depósito a bolsillo') ? 'Transacción exitosa.' : 'Error durante la transacción.')
      end
    when 5
      pocket = Session.user.get_fund(FundType.type(:pocket), Form.new('Seleccionar bolsillo', {'Nombre' => :string}).ask['Nombre'])
      if pocket.nil?
        Error.alert('El bolsillo no existe.')
      else
        Error.alert(Transfer.transfer(pocket, Session.user.get_fund(FundType.type(:account)), 'Retiro de bolsillo') ? 'Transacción exitosa.' : 'Error durante la transacción.')
      end
    when 6
      pocket = Session.user.get_fund(FundType.type(:pocket), Form.new('Seleccionar bolsillo', {'Nombre' => :string}).ask['Nombre'])
      if pocket.nil?
        Error.alert('El bolsillo no existe.')
      else
        Error.alert(Transfer.inter_user_transfer(pocket, 'Transferencia a otro usuario') ? 'Transacción exitosa.' : 'Error durante la transacción.')
      end
    when 7
      MainMenuController.start
    end
    PocketMenuController.start unless opt == 7
  end

end
