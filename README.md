mosquittobin
============
Centos 7 Dockerfile for building and installing mosquitto binaries.
docker run -it -v (pwd)/data:/data -w /data -p 1883:1883 -p 10001:10001 --rm weitzj/mosquittobin:1.4.0_centos7_websocket mosquitto -c conf/mosquitto.conf -v
