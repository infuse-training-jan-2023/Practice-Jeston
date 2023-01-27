class Question1
    def serial_average(test_string)
      if test_string[3]!='-' || test_string[9]!='-'
        return "invalid syntax of string "
      end
      splitted_string = test_string.split('-', -1)
      if splitted_string.length < 2 || splitted_string.length > 3
        return 'Invalid number of arguments in string'
      end
      average = (splitted_string[1].to_f + splitted_string[2].to_f) / 2.00
      splitted_string[0] + '-' + '%05.2f' % average
    end
  end
  
  Q1 = Question1.new
  puts Q1.serial_average('002-00.00-8.00-09.00')