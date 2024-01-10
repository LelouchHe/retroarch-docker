#!/usr/bin/env sh

# only 1 display should be valid
# kill any so supervisor can restart from 1
/opt/TurboVNC/bin/vncserver -kill :1

# start supervisord
supervisord -c /etc/supervisor/supervisord.conf
