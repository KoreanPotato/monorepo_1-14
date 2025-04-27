import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from environment!"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080)) 
    app.run(host="0.0.0.0", port=port)


#Task 2
