class UserInputChecker

  def self.convert(datum, type)
    case type
    when :unsigned_float
      return (/\A\d*\.?\d+\z/.match(datum)) ? datum.to_f : nil
    else
      datum
    end
  end
end
