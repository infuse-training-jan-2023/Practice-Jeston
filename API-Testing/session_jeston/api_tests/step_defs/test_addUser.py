
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/add_user.feature')

add_user_url = "http://127.0.0.1:5000/register"

new_user = {"name":"jeston","age":"22","mobile":"9405224378"}

@when('I pass in the details of the new user')
def add_new_user():
    pytest.api_response = requests.post(add_user_url,json=new_user)

@then('a new user should be created')
def check_item_returned():
    data = pytest.api_response.json()
    assert type(data) == dict

@then('the api status code should be 201')
def check_api_status():
    assert pytest.api_response.status_code == 201

@then('the api response content type should be text')
def check_api_content_type():
    assert pytest.api_response.headers['content-Type'] == 'application/json'