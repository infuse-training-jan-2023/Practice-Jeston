from src.Question3 import get_todo
import json

todo = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": 0
}


def test_invalid_id(mocker):
   mock = mocker.patch('src.Question3.get_todo', return_value = {"status": "error fetching- please check id submitted"})
   status = get_todo(201)
   assert status == {"status": "error fetching- please check id submitted"}

def test_valid_id(mocker):
   mock = mocker.patch('src.Question3.get_todo', return_value = todo)
   data = get_todo(1)
   assert data.json == todo


