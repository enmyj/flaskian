from flaskian.main import bp
from flask import render_template

@bp.route('/')
@bp.route('/index')
def index():
    return render_template('main.html')

@bp.route('/real')
def weird():
    return render_template('real.html')
