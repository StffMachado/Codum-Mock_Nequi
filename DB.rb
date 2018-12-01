require 'mysql2'

class DB

  def self.start
    @@client = Mysql2::Client.new(:host => "localhost", :database => 'mock_nequi', :username => "root", :password => 'codum1234')
  end

  def self.query(query)
    result = @@client.query(query)
    result.nil? ? nil : result.map {|row| row}
  end

end
