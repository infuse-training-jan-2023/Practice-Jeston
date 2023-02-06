import re

class Question1:
    
 def serial_average(self,test_string):

    pattern = '^\\d{3}-\\d{2}.\d{2}-\d{2}.\d{2}'
    if not(re.fullmatch(pattern,test_string)):
        return "The given string contains invalid characters"
    
    splitted_string = test_string.split('-', -1)
    average = (float(splitted_string[1]) + float(splitted_string[2])) / 2.00
    return splitted_string[0] + '-' + '%05.2f' % average


p1=Question1()
print (p1.serial_average("002-10.00-08.00"))