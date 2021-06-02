# Set the base image to ros-full:melodic
FROM ros:melodic

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python-pip python3-pip python3-yaml python-rosdep \
    python3-opencv python-catkin-tools software-properties-common wget \
    apt-transport-https libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev \
    libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev libpcap0.8-dev libpcap-dev

RUN python3 -m pip install rospkg catkin_pkg

# Core ROS packages
RUN apt-get install -y ros-melodic-navigation ros-melodic-teleop-twist-keyboard \
    ros-melodic-joy ros-melodic-swri-rospy ros-melodic-ddynamic-reconfigure \
    ros-melodic-geographic-msgs ros-melodic-ros-numpy ros-melodic-rosauth \
    ros-melodic-interactive-markers ros-melodic-xacro

# Gazebo Plugins
RUN apt-get install -y ros-melodic-gazebo-plugins ros-melodic-hector-gazebo-plugins

# LaserScan Manipulation
RUN apt-get install -y ros-melodic-pointcloud-to-laserscan \
    ros-melodic-ira-laser-tools ros-melodic-laser-filters

# Ros Bridge Server dependecies
RUN apt-get install -y python-backports-abc  python-backports.ssl-match-hostname \
    python-bson python-bson-ext python-singledispatch python-tornado \
    ros-melodic-rosapi ros-melodic-rosbridge-library ros-melodic-rosbridge-msgs

# Mapping
RUN apt-get install -y ros-melodic-gmapping ros-melodic-cartographer-ros

# Localization
RUN apt-get install -y ros-melodic-mrpt-localization

# Leg Tracker dependency
RUN apt-get install -y ros-melodic-image-geometry
