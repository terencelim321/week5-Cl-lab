import flask, time

app = flask.Flask(__name__)
#testzxzxzx

@app.route("/")
def index():
    return "Welcome!!! ",time.localtime
