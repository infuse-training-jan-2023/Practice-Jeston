
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/delete_item.feature')

delete_item_url = "http://127.0.0.1:5000/delete/20"

@when('I pass the id of the item to be deleted')
def delete_item():
  pytest.api_response = requests.delete(delete_item_url)
  print(pytest.api_response.json)

@then('the item should be deleted')
def check_the_items_returned():
  message = pytest.api_response
  print(pytest.api_response)
#   print('message : ',message.message)
#   assert message == "<Response [201]>"


@then('the api status code should be 201')
def check_status_code():
  assert pytest.api_response.status_code == 201

@then('the api response content type should be text')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'text'