Firefox
=======

Unofficial build of Firefox 36 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v1.3
* Added (Oracle) Java support.

v1.2
* Added audio passthrough, however this requires the --privileged argument to be set. This should be used with caution.

v1.1
* Added (Adobe) Flash support.

v1.0
* User permissions now correlate between host and container. This allows Firefox downloads to be saved back to the host system by passing in the local users uid/gid as environment variables.
```

Launch Command
---------------
```
docker run -v $HOME/Downloads:/home/firefox/Downloads:rw -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd --privileged -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name firefox -i -t chrisdaish/firefox
```

FAQ
---
Note: If you receive the following Gtk error:
```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session
```
xhost +local:docker
```
