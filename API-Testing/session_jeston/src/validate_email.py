import re

class ValidateEmail:
    def regex_check( email):
        regex = re.search('^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$', email) 
        if(regex):   
            return {"status" :"Valid Email"}   
        else:   
            return {"status" : "Invalid Email"}