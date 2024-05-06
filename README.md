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

The module-pyxtermjs does require a terminal-server with access to a ROS 2 environment. This project contains a working docker and docker-compose configuration to start a ROS 2 environment with a terminal-server.
However, you can also use the following docker command to start the terminal server immediately:

```bash
docker run -it --rm \
  --name edrys-ros-humble-lab \
  --network host \
  -e LANG=en_US.UTF-8 \
  -e LC_ALL=en_US.UTF-8 \
  -e ROS_HOSTNAME=edrys-ros-humble-lab \
  crosslab/edrys_pyxtermjs_ros:latest
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
  crosslab/edrys_pyxtermjs_ros:latest
```

more information can be found in the teacher-settings in the lab itself.
