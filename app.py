######################### NORMAL VERSION #########################

# from flask import Flask

# app = Flask(__name__)

# @app.route('/')
# def hello():
#     return f"<h1>Hello, the distributed system tutorial is the best!</h1>"

# if __name__ == '__main__':
#     app.run(debug=True, host='0.0.0.0')



######################### LOAD BALANCE DEMO VERSION #########################

# from flask import Flask
# import socket

# app = Flask(__name__)

# @app.route('/')
# def hello():
#     pod_name = socket.gethostname()
#     # use an h1 tag for the return message
#     return f"Hello from pod: {pod_name}"

# if __name__ == '__main__':
#     app.run(debug=True, host='0.0.0.0')


######################### V2 UPDATE #########################

# from flask import Flask

# app = Flask(__name__)

# @app.route('/')
# def hello():
#     response = """
#             <h1 style="font-size: 50px; text-align: center;">
#                 Hello from v2! I think prof should give us all 5s!<br>
#             </h1>
#     """
#     return response


# if __name__ == '__main__':
#     app.run(debug=True, host='0.0.0.0')
    
    
    
######################### V3 (BUGGY) UPDATE #########################
    
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    response = """
            <h1 style="font-size: 50px; text-align: center;">
                This is a buggy version!<br>
            </h1>
    """
    return response

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')