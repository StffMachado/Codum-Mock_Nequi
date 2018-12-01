class FundType

  attr_reader :db_table

  def initialize(name, db_table, unique = false)
    @name = name
    @db_table = db_table
    @unique = unique
  end

  def unique?
    @unique
  end

  def self.create_fund_types
    @@types = {}
    @@types[:account] = FundType.new('Cuenta de Ahorros', 'accounts', true)
    @@types[:mattress] = FundType.new('Colchón', 'mattresses', true)
    @@types[:pocket] = FundType.new('Bolsillo', 'pockets')
    @@types[:goal] = FundType.new('Meta', 'goals')
  end

  def self.type(id)
    @@types[id]
  end

  def self.types
    @@types
  end

  def ==(another_fund_type)
      @db_table == another_another_fund_type.db_table
  end

end
