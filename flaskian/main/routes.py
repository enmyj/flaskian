from flaskian.main import bp
from flask import render_template

@bp.route('/')
def index():
    return render_template('main.html')

@bp.route('/weird')
def weird():
    return render_template('weird.html')
