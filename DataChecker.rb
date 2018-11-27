class DataChecker

  def self.convert(datum, name, type)
    #There should be a case statement that invokes the corresponding checker for
    #each type and converts datum. For now, it just outputs the datum as it is.

    if name == 'username'
      validate_string = /^(\w+)$/
      m = validate_string.match(datum)
      unless m
      puts "Digite un nombre de usuario valido"
      return false
      end
      return true
    end

    if name == 'name'
      validate_string = /^(\D+)$/
      m = validate_string.match(datum)
      unless m
      puts 'Digite un nombre valido, solo letras entre A y Z'
      return false
    else
      return true

      end

    end

    if name == 'e-mail'
      validate_string = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      m = validate_string.match(datum)
      unless m
      puts 'Digite un email valido'
      return false
    else
      return true

      end
    end

    if name == 'password'
      validate_string = /^(\w+)$/
      m = validate_string.match(datum)
      unless m
      puts 'Digite un password valido'
      return false
    else
      return true

      end
    end

    #num_expres = /\s(\d+)\s(\d+)\b/
    #n = num_expres.match(@command.to_s)
    #datum
    #validate = true

    #while validate = false do
    #  print name + ": "
    #  datum = gets.chomp
    #end

    #puts "#{datum} y #{type} y #{name}"
    #return true
    #datum
  end
end
