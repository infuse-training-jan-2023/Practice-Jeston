
from flask import Flask, Response,request
import re

app = Flask(__name__)

@app.route('/validate', methods = ['POST'])
def validate_password():
    request_data = request.get_json()
    password = request_data['password']
    if len(password) < 8:
        return "Password isnt of correct length"
    elif not re.search("[a-z]", password):
        return "Password must contain lower case letters"
    elif not re.search("[A-Z]", password):
        return "Password should contain upper case letters"
    elif not re.search("[!@#.$%^&*()]", password):
        return "Password doesnt contain a special character"
    else:
        return "Success : The password satisfies all the conditions"

if __name__ == '__main__':
  app.run(debug = True, port = 5000, host = '0.0.0.0')