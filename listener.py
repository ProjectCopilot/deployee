#!/usr/bin/env python

import hashlib
import hmac
import json
import os
import urllib

from flask import abort
from flask import Flask
from flask import request
from subprocess import PIPE
from subprocess import Popen

basedir = os.path.dirname(os.path.abspath(__file__))
with open(basedir + '/projects.csv') as f:
    # Gets us a list of repo names
    projects = map(lambda x: x.rsplit('/', 1)[1][:-4], f.read().splitlines())

app = Flask(__name__)
app.config.from_envvar('DEPLOYEE_SETTINGS')

@app.route('/', methods=['POST'])
def webhook():
    # Verify the body
    signature = hmac.new(app.config['HUB_SECRET'], msg=request.get_data(),
                    digestmod=hashlib.sha1).hexdigest()
    if request.headers.get('X-Hub-Signature').split('=')[1] != signature:
        abort(401)
    repo = json.loads(request.values.get('payload'))['repository']['name']
    if repo in projects:
        Popen([basedir+'/scripts/refresh.sh', repo], stdout=PIPE, stderr=PIPE)
    return 'OK'

if __name__ == '__main__':
    app.run(host=app.config['HOST'], port=app.config['PORT'], debug=True)

