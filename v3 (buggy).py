import socket
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    pod_name = socket.gethostname()
    response = f"""
    <html>
        <body>
            <h1 style="font-size: 50px; text-align: center;">
                This is a buggy version!<br>
                Served by pod: {pod_name}
            </h1>
        </body>
    </html>
    """
    return response

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

