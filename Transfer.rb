require 'active_support'

class Transfer

  def self.transfer(source, destination, description = '')
    amount = Form.new(description, {'Monto' => :unsigned_float}).ask['Monto']
    return false unless source.nil? || source.withdrawal(amount)
    return false unless destination.nil? || destination.deposit(amount)
    return record_transfer(source, destination, amount)
  end

  def self.inter_user_transfer(source, description = '')
    data = Form.new(description, {'E-mail' => :email, 'Monto' => :unsigned_float}).ask
    user = User.fetch_from_db(data['E-mail'])
    return false if user.nil?
    destination = user.get_fund(FundType.type(:account))
    return false if source.nil? || !source.withdrawal(data['Monto'])
    return false if destination.nil? || !destination.deposit(data['Monto'])
    return record_inter_user_transfer(source, destination,data['Monto'])
  end

  def self.record_transfer(source, destination, amount)
    source.write_to_db unless source.nil?
    destination.write_to_db unless destination.nil?
    if source.nil? || (!destination.nil? && source.type == FundType.type(:account))
      entity = ActiveSupport::Inflector.singularize("#{destination.type.db_table}")
      DB.query("insert into #{entity}_transactions (#{entity}_id, type, amount) values ('#{destination.id}', 'deposit', #{amount})")
    else  #destination.nil? || destination.type == FundType.type(:account)
      entity = ActiveSupport::Inflector.singularize("#{source.type.db_table}")
      DB.query("insert into #{entity}_transactions (#{entity}_id, type, amount) values ('#{source.id}', 'withdrawal', #{amount})")
    end
    true
  end

  def self.record_inter_user_transfer(source, destination, amount)
    source.write_to_db unless source.nil?
    destination.write_to_db unless destination.nil?
    entity = ActiveSupport::Inflector.singularize("#{source.type.db_table}")
    src = (entity == 'account') ? 'source_account_id' : entity + '_id'
    dest = (entity == 'account') ? 'destination_account_id' : 'account_id'
    DB.query("insert into #{entity}_account_transfers (#{src}, #{dest}, amount) values ('#{source.id}', '#{destination.id}', #{amount})")
    true
  end

end
