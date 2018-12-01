require_relative 'Fund'

class User

  attr_reader :user_id
  attr_reader :email

  def initialize(user_id, first_name, last_name, email, password = nil)
    @user_id = user_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.salt(email, password)
    email + '_' + password + '_' + email.reverse
  end

  def self.fetch_from_db(email, password = nil)
    if password.nil?
      retrieved = DB.query("select * from users where email = '#{email}' limit 1")
    else
      retrieved = DB.query("select * from users where email = '#{email}' and password = sha2('#{salt(email, password)}', 256) limit 1")
    end
    return nil if retrieved.length == 0
    User.new(retrieved[0]['user_id'], retrieved[0]['first_name'], retrieved[0]['last_name'], email)
  end

  def create_in_db
    user = User.fetch_from_db(@email)
    if user.nil?
      DB.query("insert into users (first_name, last_name, email, password) values('#{@first_name}','#{@last_name}','#{@email}',sha2('#{User.salt(@email, @password)}', 256))")
      user = User.fetch_from_db(@email)
      Fund.new(nil, user, FundType.type(:account), 'Cuenta de ahorros').create_in_db
      Fund.new(nil, user, FundType.type(:mattress), 'Colchón').create_in_db
      return true
    else
      return false
    end
  end

  def funds_of_type(type)
    funds = Fund.fetch_from_db(self, type)
  end

  def all_funds
    funds = []
    FundType.types.each do |name, type|
      new_funds = Fund.fetch_from_db(self, type)
      funds = funds + new_funds unless new_funds.nil?
    end
    funds
  end

  def get_fund(type, name = '')
    retrieved = funds_of_type(type)
    return nil if retrieved.nil? || retrieved.length == 0
    type.unique? ? retrieved[0] : retrieved.find {|f| f.name == name}
  end

  def open_fund(name, type)
    Fund.new(nil, self, type, name).create_in_db
  end

  def close_fund(name, type)
    Fund.new(nil, self, type, name).delete_from_db
  end

  def ==(another_user)
      @user_id == another_user.user_id
  end

end
