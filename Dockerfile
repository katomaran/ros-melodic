# Set the base image to ros:melodic
FROM ros:melodic

RUN echo 'deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main' | tee /etc/apt/sources.list.d/realsense-public.list
RUN apt-key adv --keyserver hkp://keys.gnupg.net:80 --recv-key 6F3EFCDE

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y python-pip python3-pip python3-yaml librealsense2* 
RUN apt-get install -y libpcap0.8-dev ros-melodic-teleop-twist-keyboard 
RUN apt-get install -y ros-melodic-navigation ros-melodic-swri-rospy ros-melodic-joy 
RUN apt-get install -y python-rosdep
RUN apt-get install -y ros-melodic-rosserial-arduino ros-melodic-rosserial 
RUN apt-get install -y ros-melodic-ddynamic-reconfigure ros-melodic-geographic-msgs 
RUN apt-get install -y ros-melodic-turtlebot3-msgs ros-melodic-gmapping 
RUN apt-get install -y ros-melodic-pointcloud-to-laserscan ros-melodic-apriltag-ros #ros-melodic-hector-gazebo-plugin
RUN apt-get install -y python3-opencv python-catkin-tools ros-melodic-rslidar*
RUN apt-get install -y wkhtmltopdf
RUN apt-get install -y ros-melodic-ros-numpy
RUN apt-get install -y python-backports-abc  python-backports.ssl-match-hostname python-bson python-bson-ext 
RUN apt-get install -y python-singledispatch python-tornado ros-melodic-rosbridge-library ros-melodic-rosapi  
RUN apt-get install -y ros-melodic-rosbridge-msgs ros-melodic-rosbridge-suite
RUN apt-get install -y software-properties-common apt-transport-https wget
RUN apt-get install -y librealsense2-dkms librealsense2-utils ros-melodic-rosauth libpcap-dev
RUN apt-get install -y ros-melodic-perception-pcl*
RUN apt-get install -y ros-melodic-apriltag-ros*
RUN apt-get install -y ros-melodic-rslidar*
RUN apt-get install -y ros-melodic-sick-scan*
RUN apt-get install -y libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
RUN apt-get install -y libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
RUN apt-get install -y ros-melodic-realsense2-camera