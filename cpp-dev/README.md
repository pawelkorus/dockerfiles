# C++ Dev Image

Image with preinstalled basic c++ development tools and qtcreator.

## Building

In order to build this image run:
```
docker build --rm -t pawelkorus/cpp-dev .
```

## Running

Basic run command:
```
docker run -it --rm -e DISPLAY=$DISPLAY -e QT_XCB_GL_INTEGRATION=none -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/home/user/project --cap-add=SYS_PTRACE --security-opt seccomp=unconfined pawelkorus/cpp-dev
```
runs docker container and mounts current working directory to `/home/user/project` directory inside container.

`--cap-add` and `--security-opt` arguments are required for debugging purpose. See [stackoverflow question](https://stackoverflow.com/questions/35860527/warning-error-disabling-address-space-randomization-operation-not-permitted
) for reference.