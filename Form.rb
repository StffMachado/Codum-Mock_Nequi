require_relative 'UserInputChecker'

class Form

  #fields is a hash of {field_name : field_type}
  def initialize(title, fields)
    @title = title
    @fields = fields
  end

  def ask
    system "clear" or system "cls"
    puts "\n"<<('*'*80)<<"\n"<<'* '<<@title.center(76)<<' *'<<"\n"<<('*'*80)
    data = {}
    @fields.each do |name, type|
      loop do
        print name + ": "
        datum = gets.chomp
        data[name] = UserInputChecker.convert(datum, type)
        puts ''
        break unless data[name].nil?
        puts 'Dato no válido.'
      end
    end
    data
  end

end
