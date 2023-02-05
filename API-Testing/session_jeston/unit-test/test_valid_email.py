from src.validate_email import ValidateEmail

validate = ValidateEmail()

# def test_get_item_makes_db_call(mocker):
#   mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value = [])
#   _ = item_repo.add_item()
#   assert mock.call_count == 1

def test_validate_mail(mocker):
  mock = mocker.patch('src.validate_email.ValidateEmail.regex_check', return_value = {"status" : "Valid Email"})
  status = validate.regex_check("imjeston@gmail.com")
  assert status == {"status" : "Valid Email"}

def test_invalid_mail(mocker):
  mock = mocker.patch('src.validate_email.ValidateEmail.regex_check', return_value = {"status" : "Invalid Email"})
  status = validate.regex_check("@imjeston@gmail.com")
  assert status == {"status" : "Invalid Email"}