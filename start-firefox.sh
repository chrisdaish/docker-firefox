#!/bin/bash
groupmod -g $gid firefox
usermod -u $uid -g $gid firefox
exec su -ls "/bin/bash" -c "/usr/bin/firefox" firefox
