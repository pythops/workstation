#!/bin/bash

sudo ip route add 10.96.0.0/12 via 192.168.49.2
sudo ip route add 172.17.0.0/16 via 192.168.49.2
