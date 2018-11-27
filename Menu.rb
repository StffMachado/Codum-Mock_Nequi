class Menu

  def initialize(title, options)
    @title = title
    @options = options
  end



  def ask
    while true
      show
      sel_opt = gets.chomp
      return sel_opt.to_i if /\A\d+\z/.match(sel_opt) and sel_opt.to_i>=1 and sel_opt.to_i<=@options.length
    end
  end

private

  def show
    system "clear" or system "cls"
    puts "\n\n"<<('*'*80)<<"\n"<<'* '<<@title.center(76)<<' *'<<"\n"<<('*'*80)
    k= 1
    @options.each do |opt|
      puts "#{k}.\t#{opt}"
      k = k + 1
    end
    print "Opción: "
  end

end
