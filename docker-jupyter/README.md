## Run Jupyter server in a container in a safe and convinient way

This Dockerfile and the run scripts allow to run Jupyter server under current user's UID and persist any modules a user installs in her/his notebook cell with `pip install --user` command. The modeules and any other data are saved in `home` directory that is mapped inside a container. Container will be removed upon exit, but any jupyter settings and pakcages installed with pip install --user are kept in home folder. Remove them if you need a completely fresh image.




## Usage:

```
 ./run_jupyter.sh [image]
```

Parameters:

   image - optional. A custom image to use instead of a default. If it is given, 
           we will not attemp to pull the latest image. This allows local image development.

## Note on running under Windows

### Versions supported

All Windows versions are supported, whether it's Win 10 with Hyper-V or Win 7 with Virtualbox (aka Docker toolbox).

### Notes

Attention Windows Toolbox users - you MUST put the course repo in C:\Users\%username\mlcourse.ai

Attention all Windows users: Use Ctrl-C to shut down. If you close the window, the container may still be running.

### Troubleshooting

Docker toolbox: When you change your windows password, you'll have to re-register C volume somewhere in Toolbox controls.

