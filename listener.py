#!/usr/bin/env python

import hmac
import os

from flask import abort
from flask import Flask
from flask import request
from subprocess import call

basedir = os.path.dirname(os.path.abspath(__file__))
with open(basedir + '/projects.csv') as f:
    # Gets us a list of repo names
    projects = map(lambda x: x.rsplit('/', 1)[1][:-4], f.read().splitlines())

app = Flask(__name__)
app.config.from_envvar('DEPLOYEE_SETTINGS')

@app.route('/', methods=['POST'])
def webhook():
    # Verify the body
    signature = hmac.new(app.config['HUB_SECRET'], request.get_data()).hexdigest()
    if request.headers.get('X-Hub-Signature') != signature:
        abort(401)
    repo = request.values.get('repository')['name']
    if repo in projects:
        call(basedir+'/scripts/refresh.sh', repo)
    return 'OK'

if __name__ == '__main__':
    app.run(host=app.config['HOST'], port=app.config['PORT'], debug=True)

