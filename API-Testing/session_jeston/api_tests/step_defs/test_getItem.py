
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/get_a_item.feature')

get_item_url = "http://127.0.0.1:5000/get/8"

@when('I search for a item based on id')
def get_a_item():
  pytest.api_response = requests.get(get_item_url)

@then('I should get the item having that id')
def check_the_items_returned():
  print("hello")
  print(pytest.api_response)
  item = pytest.api_response.json()
  print('Data:', item)
  assert type(item) == list

@then('the api status code should be 201')
def check_status_code():
  assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'