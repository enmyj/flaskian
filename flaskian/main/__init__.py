from flask import Blueprint

bp = Blueprint('main', __name__)

from flaskian.main import routes
