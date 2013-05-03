#note I got serious help from the solutions on this one.

def queryClasses(data, criteria)
	operators = {
    :gt => lambda {|a,b| a > b },
    :gte => lambda {|a,b| a >= b },
    :lt => lambda {|a,b| a < b },
    :lte => lambda {|a,b| a <= b },
    :eq => lambda {|a,b| a == b },
    :neq => lambda {|a,b| a != b },
    :exists => lambda {|a,b| !(a.nil? ^ b) }
  }

  filter = criteria[:filter]
  sort_by = criteria[:sort_by]
  select = criteria[:select]

  if not filter.nil?
    data = data.select { |item|
      filter.all? { |attr, conditions|
        conditions.all? { |op, condition|
          comparators[op].call(item[attr], condition)
        }
      }
    }
  end

  if not sort_by.nil?
    data = data.sort_by { |item|
      item[sort_by]
    }
  end

  if not select.nil?
    data = data.map { |item|
      item.reject {|key, value|
        !select.include?(key)
      }
    }
  end

  data[0...(criteria[:limit] || data.size)]
end

data = [{
  :department => 'CS',
  :number => 101,
  :name => 'Intro to Computer Science',
  :credits => 1.00
}, {
  :department => 'CS',
  :number => 82,
  :name => 'The Internet Seminar',
  :credits => 0.5
}, {
  :department => 'ECE',
  :number => 52,
  :name => 'Intro to Digital Logic'
  # Note that the :credits key-value pair is missing
}]
criteria = {
  :filter => {
    :number => {
      :gt => 80
    },
    :credits => {
      :gte => 0.5
    }
  },
  :select => [:number, :name],
  :sort_by => :number
}

puts queryClasses(data, criteria)