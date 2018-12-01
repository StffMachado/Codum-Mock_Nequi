require 'io/console'

class Error

  def self.alert(msg)
    puts msg
    STDIN.getch
  end

end
