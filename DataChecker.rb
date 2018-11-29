
require_relative 'ControllerUser'

class DataChecker

  def self.convert(datum, name, type)
    #There should be a case statement that invokes the corresponding checker for
    #each type and converts datum. For now, it just outputs the datum as it is.
   if datum.length == 0 && name == 'username'
     puts "Ingrese un valor "
     return false
   elsif datum.length > 0 && name == 'username'
      validate_string = /^(\S+)$/
      m = validate_string.match(datum)
      unless m
      puts "Digite un nombre valido, no incluir espacios en blanco"
      return false
      else
      return true
      end
    end

    if datum.length == 0 && name == 'name'
      puts "Ingrese un valor "
      return false
    elsif datum.length > 0 && name == 'name'
      validate_string = /^(\D+)$/
      m = validate_string.match(datum)
      unless m
      puts 'Digite un nombre valido, solo letras entre A y Z'
      return false
    else
      return true
      end
    end

    if datum.length == 0 && name == 'e-mail'
      puts "Ingrese un valor "
      return false
    elsif datum.length > 0 && name == 'e-mail'
      validate_string = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      m = validate_string.match(datum)
      unless m
      puts 'Digite un email valido'
      return false
    else
      return true
      end
    end

    if datum.length == 0 && name == 'password'
      puts "Ingrese un valor "
      return false
    elsif datum.length > 0 && name == 'password'
      validate_string = /^(\w+)$/
      m = validate_string.match(datum)
      unless m
      puts 'Digite un password valido'
      return false
    else
      return true

      end
    end

  end
end
