# Dockerfiles

This repository contains various Dockerfiles that I find useful in my workflow. Images built from these Dockerfiles will be hosted on Docker Hub here: https://hub.docker.com/u/vlandau
<br/>

### Some useful notes
---
**Launching Juno IDE GUI**:

The Juno IDE image has only been tested using Ubuntu 18.04 on the local machine. Getting the GUI to display on Windows and MacOS will require alternative methods.

To luanch the GUI, run the Juno IDE image using the following commands:
```bash
xhost local:root
docker run -d --rm -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
              	   -v $HOME/.atom:/home/atom/.atom \
              	   -e DISPLAY \
              	   vlandau/juno:latest
```
`xhost local:root` allows root access to your display, which allows the GUI to be launched to your desktop.

`-v $HOME/.atom:/home/atom/.atom` is optional, and allows you to save the configurations/preferences you set in Atom (so you don't need to set them each time you run the container). Run `mkdir $HOME/.atom`, and make the directory writable by running `sudo chmod a=rxw $HOME/.atom`. 

Once you've launched the GUI, follow the directions [here](http://docs.junolab.org/latest/man/installation/) (list item #4) to get Juno up and running.

**Running Jupyter (Julia and python or spatial)**:
```bash
docker run -it --rm \
     -v "$(pwd)":/home/jupyter \
     -p 8888:8888 \
     vlandau/jupyter:julia-python3
```