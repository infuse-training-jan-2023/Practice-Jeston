import re

class Question1:

 def __init__(self,test_string):
    self.test_string = test_string
    
 def serial_average(self):

    pattern = '^\\d{3}-\\d{2}.\d{2}-\d{2}.\d{2}'
    if not(re.fullmatch(pattern,self.test_string)):
        return "The given string contains invalid characters"
    # elif self.test_string[3]!='-' or self.test_string[9]!='-':
    #   return "invalid syntax of string "
    
    splitted_string = self.test_string.split('-', -1)
    # if len(splitted_string) < 2 or len(splitted_string) > 3:
    #   return 'Invalid number of arguments in string'
    average = (float(splitted_string[1]) + float(splitted_string[2])) / 2.00
    return splitted_string[0] + '-' + '%05.2f' % average


p1=Question1("002-10.00-08.00")
print (p1.serial_average())