# convert_caffe_windows
Convert caffe to tensorflow for Windows using Docker. Inspired by https://github.com/nicolov/segmentation_keras/tree/master/conversion.

Tested on Docker for Win10 (you may get Docker for Windows from here: https://docs.docker.com/docker-for-windows/install/#download-docker-for-windows). To run docker I used Windows PowerShell.
Have not tested on previous versions of Windows yet. In this case you need a virtual machine for running docker (e.g. https://www.virtualbox.org/), and Docker Toolbox (https://docs.docker.com/toolbox/toolbox_install_windows/). 

## Edit the Dockerfile before running
Add links to your caffe files you want to transform (`.caffemodel` and `.prototxt`).

## Commands to run docker
Build a docker image from the Dockerfile:
`docker build . -t newimage`
Run the command:
`docker run -v $pwd/converted:/workspace -ti newimage`

