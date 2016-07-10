Deployee
========

This manages deployment of services in response to GitHub webhook requests. Run `scripts/setups.sh` to set yourself up, hit `deploy.sh` to start the listener, sit back, and relax.

### Configuration
Your app should be configured in `settings.cfg`. Here is an example:
```
HUB_SECRET = 'whatdoesthef0xsay'
HOST = '0.0.0.0'
PORT = 1234
```

