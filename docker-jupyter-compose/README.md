## Docker-compose approach to run Jupyter server in a container

Docker compoise file allows to build an extra layer on top of an existing image adding current user name and user id to the image, so that it runs as current user. any chnages are persisted in a container.

Docker copose approach allows to keep the container and not recreate it every rume (as with run). But if a doicker-copose file is changes substantially, the container is rebuilt and any changes user makes in his Jupyter notebook are lost.

It's better to use the other set of scripts from the `docker-jupyter` folder. They also run secure with a current user's id and allow to save e.g. any new packages installed in a `home` directory on the host.


