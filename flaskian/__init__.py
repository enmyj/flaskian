from flask import Flask, render_template, url_for

def create_app():
    app = Flask(__name__, instance_relative_config=True)

    from flaskian.main import bp as main_bp
    app.register_blueprint(main_bp)

    return app
