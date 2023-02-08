import re

class ValidatePassword:
    def validate_password(self,password):
        if len(password) < 8:
            return "Password isnt of correct length"
        elif not re.search("[a-z]", password):
            return "Password must contain lower case letters"
        elif not re.search("[A-Z]", password):
            return "Password should contain upper case letters"
        elif not re.search("[!@#.$%^&*()]", password):
            return "Password doesnt contain a special character"
        else:
            return "Success : The password satisfies all the conditions"