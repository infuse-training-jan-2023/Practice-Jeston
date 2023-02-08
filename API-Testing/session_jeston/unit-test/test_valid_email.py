from src.validate_email import ValidateEmail

validate = ValidateEmail()


def test_validate_mail(mocker):
  mock = mocker.patch('src.validate_email.ValidateEmail.is_valid_email', return_value = {"status" : "Valid Email"})
  status = validate.is_valid_email("imjeston@gmail.com")
  assert status == {"status" : "Valid Email"}

def test_invalid_mail(mocker):
  mock = mocker.patch('src.validate_email.ValidateEmail.is_valid_email', return_value = {"status" : "Invalid Email"})
  status = validate.is_valid_email("@imjeston@gmail.com")
  assert status == {"status" : "Invalid Email"}