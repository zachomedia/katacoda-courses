#!/bin/sh

sleep 1

mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

ssh root@docker "docker pull prom/prometheus:latest && docker pull quay.io/prometheus/node-exporter:v0.13.0"
