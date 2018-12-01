require_relative 'AccountMenuController'
require_relative 'MattressMenuController'
require_relative 'PocketMenuController'
require_relative 'GoalMenuController'

class MainMenuController

  def self.start
    process_option(MenuManager.menu(:main).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      AccountMenuController.start
    when 2
      MattressMenuController.start
    when 3
      PocketMenuController.start
    when 4
      GoalMenuController.start
    when 5
      #Aquí va la lista de transacciones
    when 6
      EntryMenuController.start
    end
  end

end
