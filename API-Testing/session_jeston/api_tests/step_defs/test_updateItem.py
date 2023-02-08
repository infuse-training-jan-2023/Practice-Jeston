import pytest 
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/update_item.feature')

update_a_item_url = "http://127.0.0.1:5000/update/13"

item = {"item":"updated item","status":"started","reminder":0}

@when('I pass in the details of the new item')
def update_item():
    pytest.api_response = requests.put(update_a_item_url,json=item)
    print(pytest.api_response.json())
@then('The item should be updated')
def check_item_returned():
    body = pytest.api_response.json()
    assert type(body) == dict

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_response_is_json():
    assert pytest.api_response.headers['content-type'] == 'application/json'