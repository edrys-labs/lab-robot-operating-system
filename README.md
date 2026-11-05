# Lab - Robot Operating System 2 (ROS-humble)

Welcome to the ROS 2 Humble Remote Lab! This interactive learning environment is designed to introduce beginners to the fundamentals of ROS 2 (Robot Operating System 2) Humble, the latest long-term support release of the popular robotics middleware.
This lab provides a rudimentary edrys-lab that be used as a basis for further extensions and adaptions.

## Lab Overview

This lab consists of two modules:

1. [module-markdown-it](https://github.com/edrys-labs/module-markdown-it):
   This module is used to render the markdown content of the lab.
2. [module-pyxtermjs](https://github.com/edrys-labs/module-pyxtermjs):
   This module is used to provide a terminal interface to the lab.

---

The current lab-configuration can be imported from here:

https://raw.githubusercontent.com/edrys-labs/lab-robot-operating-system/main/laboratory/ros-humble.yml

---

If you already have created a new classroom at:

https://edrys-labs.github.io

then simply copy the lab-config URL and import the lab configuration:

... Otherwise try out the fast deploy by clicking onto the Deploy-Button. This will load the configuration automatically within your browser. The created classroom will be unique and can be shared with your students.

[<img src="https://img.shields.io/badge/%F0%9F%9A%80%20-%20Deploy%20Lab%20-%20light?style=plastic" height="25" />](https://edrys-labs.github.io/?/deploy/https://raw.githubusercontent.com/edrys-labs/lab-robot-operating-system/main/laboratory/ros-humble.yml)

## Stations

The module-pyxtermjs does require a terminal-server with access to a ROS 2 environment. This project contains a Dockerfile and a docker-compose configuration that build a ROS 2 Humble environment on top of the [module-pyxtermjs](https://github.com/edrys-labs/module-pyxtermjs) terminal server image.

Build the image once:

```bash
git clone https://github.com/edrys-labs/lab-robot-operating-system
docker build -t edrys-ros-humble-lab lab-robot-operating-system
```

Then start the terminal server (or use `docker compose up` in this folder):

```bash
docker run -it --rm \
  --name edrys-ros-humble-lab \
  --network host \
  -e LANG=en_US.UTF-8 \
  -e LC_ALL=en_US.UTF-8 \
  -e ROS_HOSTNAME=edrys-ros-humble-lab \
  edrys-ros-humble-lab
```

If you want to connect your local ROS environment with the one in the terminal-server, you can use the following command, then add a `ROS_MASTER_URI`, which can be found by using the command `hostname` if you are also running the station and the ros-master on the same machine. Otherwise, you need to replace the hostname with the appropriate IP address manually.

```bash
docker run -it --rm \
  --name edrys-ros-humble-lab \
  --network host \
  -e LANG=en_US.UTF-8 \
  -e LC_ALL=en_US.UTF-8 \
  -e ROS_MASTER_URI=http://${hostname}:11311 \
  -e ROS_HOSTNAME=edrys-ros-humble-lab \
  edrys-ros-humble-lab
```

more information can be found in the teacher-settings in the lab itself.
