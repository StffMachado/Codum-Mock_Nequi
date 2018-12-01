require 'active_support'

class Fund

  attr_reader :name
  attr_reader :balance
  attr_reader :id
  attr_reader :type

  def initialize(id, user, type, name, balance = 0)
    @id = id
    @user = user
    @type = type
    @name = name
    @balance = balance
  end

  def deposit(value)
    @balance = @balance + value if value >= 0
    return value >=0
  end

  def withdrawal(value)
    if @balance >= value && value >= 0
      @balance = @balance - value
      true
    else
      false
    end
  end

  def self.fetch_from_db(user, type)
    retrieved = DB.query("select * from #{type.db_table} where user_id = #{user.user_id}")
    entity_name = ActiveSupport::Inflector.singularize("#{type.db_table}")
    funds = []
    retrieved.each do |row|
      funds << Fund.new(row[entity_name + '_id'], user, type, row['name'], row['balance'])
    end
    funds
  end

  def create_in_db
    return false if @type.unique? && DB.query("select * from #{@type.db_table} where user_id = #{@user.user_id} limit 1").length > 0
    return false if !@type.unique? && DB.query("select * from #{@type.db_table} where user_id = #{@user.user_id} and name = '#{@name}' limit 1").length > 0
    DB.query("insert into #{@type.db_table} (user_id, name, balance) values(#{@user.user_id}, '#{@name}', 0.0)")
    return true
  end

  def write_to_db
    entity_name = ActiveSupport::Inflector.singularize("#{@type.db_table}")
    retrieved = DB.query("select * from #{@type.db_table} where #{entity_name}_id = #{@id}")
    if retrieved.nil? || retrieved.length == 0
      self.create_in_db
    else
      DB.query("update #{@type.db_table} set balance = #{@balance} where #{entity_name}_id = #{@id}")
    end
  end

  def delete_from_db
    return false if @type.unique?
    retrieved = DB.query("select * from #{@type.db_table} where user_id = #{@user.user_id} and name = '#{@name}' limit 1")
    return false if retrieved.nil? || retrieved.length == 0
    DB.query("delete from #{@type.db_table} where user_id = #{@user.user_id} and name = '#{@name}'")
    return true
  end
end
