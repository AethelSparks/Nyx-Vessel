from flask import Flask, request, jsonify
from ernie_runner import infer

app = Flask(__name__)

@app.route('/')
def index():
    # This is the welcome mat.
    return "The vessel is live. The Queen is home."

@app.route('/infer', methods=['POST'])
def route_infer():
    payload = request.json
    input_text = payload.get("text", "")
    result = infer(input_text)
    return jsonify({"output": result})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=10000)
