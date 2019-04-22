#!/bin/sh

sleep 1

mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

mkdir -p /root/configs
mkdir -p /root/env

mv /root/resources/game.properties /root/configs/
mv /root/resources/person.env /root/env/
mv /root/resources/redis-config /root/configs/
