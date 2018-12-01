require_relative 'Login'
require_relative 'Signup'

class EntryMenuController

  def self.start
    process_option(MenuManager.menu(:entry).ask)
  end

  def self.process_option(opt)
    case opt
    when 1
      Login.start
    when 2
      Signup.start
    end
  end

end
