# prometheus_exporters


# Blackbox exporter [![Build Status](https://travis-ci.org/prometheus/blackbox_exporter.svg)][travis]

[![CircleCI](https://circleci.com/gh/prometheus/blackbox_exporter/tree/master.svg?style=shield)][circleci]
[![Docker Repository on Quay](https://quay.io/repository/prometheus/blackbox-exporter/status)][quay]
[![Docker Pulls](https://img.shields.io/docker/pulls/prom/blackbox-exporter.svg?maxAge=604800)][hub]

The blackbox exporter allows blackbox probing of endpoints over
HTTP, HTTPS, DNS, TCP and ICMP.


### step 1
cp blackbox.yml /etc/prometheus/


### step 2
./ blackbox-exporter.sh

### step 3 
add config to prometheus exporter
