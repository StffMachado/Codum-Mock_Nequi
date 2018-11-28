require 'mysql2'

begin
    client = Mysql2::Client.new(:host => 'localhost', :database => 'nequi', :username => "root", :password => "admin")
    results = client.query("SELECT * FROM user")
    puts "#{results}"
rescue Mysql2::Error => e
    puts e.errno
    puts e.error
ensure
    client.close if client
end
