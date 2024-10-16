# app/__init__.py
from flask import Flask
from flask_pymongo import PyMongo

# Initialize PyMongo
mongo = PyMongo()

def create_app():
    app = Flask(__name__)
    app.config.from_object('app.config.Config')

    mongo.init_app(app)
    print("MongoDB initialized.")

    from .routes import main as main_blueprint
    app.register_blueprint(main_blueprint)
    print("Routes registered.")

    return app