#!/bin/sh
envsubst < /usr/src/app/luigienv.cfg > /usr/src/app/luigi.cfg;
luigid --background --pidfile /tmp/pidfile --logdir /tmp &
sleep 10;
python crontasks.py "$@"
