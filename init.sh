#!/bin/sh

# Copy bower dependencies when using -v $PWD/:/usr/src/app
if [ -f /.dockerenv ] && [ ! -f /usr/src/app/bower_components ]; then
    ln -s /usr/src/bower_components /usr/src/app/;
fi

envsubst < /usr/src/app/indexenv.html > /usr/src/app/index.html;

bower link --allow-root
bower link $APP_NAME --allow-root
http-server .
