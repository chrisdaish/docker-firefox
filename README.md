Firefox
=======

Unofficial build of Firefox 50 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v2.1
* Version bumped to 50

v2.0
* Version bumped to 46

v1.9
* Version bumped to 43

v1.8
* Version bumped to 42.

v1.7
* Version bumped to 41.

v1.6
* Optional environment variables 'ARGS' and 'URL' can now be passed into the container. For example: -e ARGS=-jsconsole -e URL=http://www.docker.com

v1.5
* Firefox 36 upgraded to 37.

v1.4
* Automatic bookmark population by host mounting additional config.
  I have included the sample config in my [GitHub](https://github.com/chrisdaish/docker-firefox/tree/master/configFiles).

v1.3
* Added (Oracle) Java support.
* Additional configuration files can now be mounted inside the container (see example below).

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
docker run -v $HOME/Downloads:/home/firefox/Downloads:rw -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd --privileged -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name firefox chrisdaish/firefox
```
Additional config example:

```
docker run  -v $HOME/<pathToConfigFiles>/xulstore.json:/home/firefox/.mozilla/firefox/xulstore.json:ro \
            -v $HOME/<pathToConfigFiles>/bookmarks.json:/home/firefox/.mozilla/firefox/bookmarkbackups/bookmarks-2015-03-30.json:ro \
            -v $HOME/<pathToConfigFiles>/mozilla.cfg:/usr/lib/firefox/mozilla.cfg:ro \
            -v $HOME/<pathToConfigFiles>/local-settings.js:/usr/lib/firefox/defaults/pref/local-settings.js:ro \
            -v $HOME/Downloads:/home/firefox/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            -e URL=http://www.docker.com \
            --privileged \
            --name firefox \
            chrisdaish/firefox
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
