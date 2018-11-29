require 'mysql2'



class Connection

 def connection_db

    @client = Mysql2::Client.new(:host => 'localhost', :database => 'nequi', :username => "root", :password => "admin")


    rescue Mysql2::Error => e
      puts e.errno
      puts e.error
    ensure
      @client.close if @client
    end


def insert_user(data)
    self.connection_db
    @insert = @client.query("SELECT * FROM user").each do |row|
    puts row["password"]
    end

end



end
