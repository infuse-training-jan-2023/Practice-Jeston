
from flask import Flask, Response,request
import re
from Question2_class import ValidatePassword

validate = ValidatePassword()

app = Flask(__name__)

@app.route('/validate', methods = ['POST'])
def validate_password():
    request_data = request.get_json()
    password = request_data['password']
    message = validate.validate_password(password)
    return Response(message, mimetype='application/json', status=201)

if __name__ == '__main__':
  app.run(debug = True, port = 5000, host = '0.0.0.0')