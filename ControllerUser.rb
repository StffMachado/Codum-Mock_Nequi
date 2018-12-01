require 'mysql2'


class ControllerUser



    def insertuser(data)

      datauser = {}

      data.each do |name, type|
          datauser[name] = data[name]
      end

      user = datauser["username"]
      name = datauser["name"]
      email = datauser["e-mail"]
      password = datauser["password"]

      begin
      @client = Mysql2::Client.new(:host => 'localhost', :database => 'nequi', :username => "root", :password => "admin")

      pst = @client.prepare "INSERT INTO user(user, name, email, password) VALUES (?, ?, ?, SHA2(?, 224))"
      pst.execute user, name, email, password

      rescue Mysql2::Error => e
        #puts e.errno
        #puts e.error
      ensure
        @client.close if @client
        pst.close if pst
      end
    end
  end
