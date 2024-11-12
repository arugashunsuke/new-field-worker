from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/", methods=["GET"])
def hello_world():
    return jsonify({"message": "Hello, Cloud Run!"})

@app.route("/greet", methods=["POST"])
def greet():
    data = request.get_json()
    name = data.get("name", "World")
    return jsonify({"message": f"Hello, {name}!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)