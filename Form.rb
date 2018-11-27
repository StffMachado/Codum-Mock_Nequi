require_relative 'DataChecker'

class Form

  #fields is a hash of {field_name : field_type}
  def initialize(title, fields)
    @title = title
    @fields = fields
  end

  def ask(name)
    system "clear" or system "cls"
    puts "\n\n"<<('*'*80)<<"\n"<<'* '<<@title.center(76)<<' *'<<"\n"<<('*'*80)

    data = {}
    @fields.each do |name, type|
      loop do
        print name + ": "
        datum = gets.chomp


        data[name] = DataChecker.convert(datum, name, type)
        while data[name] == false do
          print name + ": "
          datum = gets.chomp
          data[name] = DataChecker.convert(datum, name, type)
        end

        puts ''
        break unless data[name].nil?
        puts 'Dato no válido.'
      end
    end
    puts "#{data}"
  end

end
