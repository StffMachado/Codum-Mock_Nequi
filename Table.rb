class Table

  #data is a list of hashes, one for each table entry
  def initialize(title, data)
    @title = title
    @data = data
  end

  def show
    system "clear" or system "cls"
    fields = extract_fields(@data)
    col_width = calc_column_width(fields, @data)
    table_width = col_width.sum + col_width.length + 1
    puts "\n"<<('-'*table_width)<<"\n"<<'|'<<@title.center(table_width-2)<<'|'<<"\n"<<('='*table_width)
    for i in 0..fields.length-1 do
      print '|'<<fields[i].to_s.center(col_width[i])
    end
    puts '|'<<"\n"<<('='*table_width)
  @data.each do |entry|
      for i in 0..fields.length-1 do
        print '|'<<entry[fields[i]].to_s.center(col_width[i])
      end
      puts '|'<<"\n"<<('-'*table_width)
    end
  end

private

  def extract_fields(data)
    fields = []
    data.each do |entry|
      entry.each do |field, datum|
        fields << field unless fields.include?(field)
      end
    end
    fields
  end

  def calc_column_width(fields, data)
    col_width = []
    fields.each do |field|
      col_w = field.length
      data.each do |entry|
        col_w = [col_w, entry[field].to_s.length].max unless entry[field].nil?
      end
      col_width << col_w + 4
    end
    col_width
  end
end
