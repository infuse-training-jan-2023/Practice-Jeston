
from flask import Flask, Response
import requests
import json

app = Flask(__name__)


@app.route('/gettodo/<int:id>', methods = ['GET'])
def get_todo(id):
    try:
            if id in range (1,201):
                url= f"https://jsonplaceholder.typicode.com/todos/{id}"
                response = requests.get(url)
                data=response.json()
            if response == {}:
                    return Response("{'error': 'Erro fetching the item'}", mimetype='application/json', status=500)
            return Response(json.dumps(data), mimetype='application/json', status=201)
    except:
        return {"status": "error fetching- please check id submitted"}

if __name__ == '__main__':
  app.run(debug = True, port = 5000, host = '0.0.0.0')