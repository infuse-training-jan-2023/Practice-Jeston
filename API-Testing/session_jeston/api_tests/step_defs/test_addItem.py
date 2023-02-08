
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/insert_item.feature')

add_item_url = "http://127.0.0.1:5000/insert"

new_item = {"item":"new item","reminder":True,"status":"pending"}

@when('I pass in the details of the new item')
def add_new_item():
    pytest.api_response = requests.post(add_item_url,json=new_item)
    print(pytest.api_response)
    print("bye")

@then('I should get the new item inserted')
def check_item_returned():
    data = pytest.api_response.json()
    print(type(data))
    assert type(data) == dict

@then('the api status code should be 201')
def check_api_status():
    assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_api_content_type():
    assert pytest.api_response.headers['content-Type'] == 'application/json'