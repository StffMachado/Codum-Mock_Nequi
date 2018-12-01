require_relative 'DB'
require_relative 'FundType'
require_relative 'MenuManager'
require_relative 'EntryMenuController'

DB.start
FundType.create_fund_types
MenuManager.create_menus

EntryMenuController.start
