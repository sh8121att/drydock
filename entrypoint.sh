#!/bin/bash

CMD="drydock"
PORT=${PORT:-9000}

set -e

if [ "$1" = 'server' ]; then
    exec uwsgi --http :${PORT} -w drydock_provisioner.drydock --callable drydock --enable-threads -L --pyargv "--config-file /etc/drydock/drydock.conf"
fi

exec ${CMD} $@
