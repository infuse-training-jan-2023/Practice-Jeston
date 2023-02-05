from src.Question2_class import ValidatePassword

validate = ValidatePassword()

def test_valid_password(mocker):
   mock = mocker.patch('src.Question2_class.ValidatePassword', return_value = "Success : The password satisfies all the conditions")
   status = validate.validate_password("@Qwerty123")
   assert status == "Success : The password satisfies all the conditions"

def test_invalid_no_of_characters(mocker):
   mock = mocker.patch('src.Question2_class.ValidatePassword', return_value = "Password doesnt contain a special character")
   status = validate.validate_password("Qwerty123")
   assert status == "Password doesnt contain a special character"

def test_invalid_length(mocker):
   mock = mocker.patch('src.Question2_class.ValidatePassword', return_value = "Password isnt of correct lengthr")
   status = validate.validate_password("Qwerty")
   assert status == "Password isnt of correct length"

def test_no_upperCaseLetters(mocker):
   mock = mocker.patch('src.Question2_class.ValidatePassword', return_value = "Password should contain upper case letters")
   status = validate.validate_password("qwertyyu")
   assert status == "Password should contain upper case letters"

def test_no_lowerCaseLetters(mocker):
   mock = mocker.patch('src.Question2_class.ValidatePassword', return_value = "Password must contain lower case letters")
   status = validate.validate_password("QWERTYIOP")
   assert status == "Password must contain lower case letters"