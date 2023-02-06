
from flask import Flask, Response, request
from item_actions import ItemActions
from user_actions import UserActions
from validate_email import ValidateEmail  
import json

app = Flask(__name__)
item_actions = ItemActions()
user_actions = UserActions()




@app.route('/verify_email', methods = ['POST'])
def verify_email():
  request_data = request.get_json()
  email = request_data['email']
  message = ValidateEmail.is_valid_email(email)
  return Response(json.dumps(message), mimetype='application/json', status=201)

@app.route('/items', methods = ['GET'])
def get_all_items():
  items = item_actions.get_all_items()
  print(items)
  return Response(json.dumps(items), mimetype='application/json', status=200)

# create an api to add a new item
@app.route('/insert', methods = ['POST'])
def add_new_item():
  request_data = request.get_json()
  name = request_data['item']
  reminder = request_data['reminder']
  status = request_data['status']
  added_item = item_actions.add_item(name, status,reminder)
  if added_item == {}:
    return Response("{'error': 'Error addding the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_item), mimetype='application/json', status=201)

# create an api to delete a new item
@app.route('/delete/<id>', methods = ['delete'])
def delete_item(id):
  deleted_item = item_actions.delete_item(id)
  if deleted_item == "deleted":
    return Response("{'error': 'Error deleting the item'}", mimetype='application/json', status=500)
  return Response("{'Status': 'Suceessfully deleted the item'}", mimetype='text', status=201)


# create an update to add a new item
@app.route('/get/<id>', methods = ['GET'])
def get_item(id):
  item = item_actions.get_item(id)
  print(item)
  if item == {}:
    return Response("{'error': 'Error getting the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(item), mimetype='application/json', status=201)

# create an update to add a new item
@app.route('/update/<id>', methods = ['PUT'])
def update_item(id):
  request_data = request.get_json()
  
  item = item_actions.update_item(id,request_data)

  if item == {}:
    return Response("{'error': 'Error updating the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(item), mimetype='application/json', status=201)

  # create an update to add a new item
@app.route('/register', methods = ['POST']) 
def register_user():
  request_data = request.get_json()
  name = request_data['name']
  age = request_data['age']
  mobile = request_data['mobile']
  print(name,age,mobile)
  user = user_actions.add_user(name,age,mobile)
  print(user)
  if user == {}:
    return Response("{'error': 'Error registering the user}", mimetype='application/json', status=500)
  return Response(json.dumps(user), mimetype='application/json', status=201)


 # create an update to add a new item
@app.route('/savedata', methods = ['GET']) 
def savedata():
  user = item_actions.savedata()
  print(user)
  if user == {}:
    return Response("{'error': 'Error registering the user}", mimetype='application/json', status=500)
  return Response(json.dumps(user), mimetype='application/json', status=201)

if __name__ == '__main__':
  app.run(debug = True, port = 5000, host = '0.0.0.0')