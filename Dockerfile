FROM crosslab/edrys_pyxtermjs:latest

# change the user, so that the packages can be installed on top of edrys_pyxtermjs
USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales curl
RUN DEBIAN_FRONTEND=noninteractive locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository universe
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ros-humble-desktop ros-dev-tools


RUN echo "source /opt/ros/humble/setup.bash" >> /home/appuser/.bashrc
RUN echo "source /opt/ros/humble/setup.zsh" >> /home/appuser/.zshrc

# Fix zsh warnings about the completion directory
SHELL ["/bin/zsh", "-c"]
RUN ZSH_DISABLE_COMPFIX=true
RUN chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/tig \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/sudo \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/npm \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/mix \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/gitignore \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/git-extras \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/git \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/docker-machine \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/docker-compose \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins/docker \
    && chmod g-w,o-w /home/appuser/.oh-my-zsh/plugins

# get back to the default appuser
USER appuser

EXPOSE 5000
# ROS2 Master - port
EXPOSE 11311
# ROS2 DDS Ports
EXPOSE 7400
EXPOSE 7410
EXPOSE 7420


ENTRYPOINT python3 -m pyxtermjs --cors True --host 0.0.0.0 --command zsh
