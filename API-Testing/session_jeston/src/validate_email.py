import re

class ValidateEmail:
    def is_valid_email( email):
        is_valid_email = re.search('^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$', email) 
        if(is_valid_email):   
            return {"status" :"Valid Email"}   
        else:   
            return {"status" : "Invalid Email"}