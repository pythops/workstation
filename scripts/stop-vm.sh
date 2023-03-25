#!/usr/bin/env bash

pid=$(/usr/bin/ps aux | grep archbox/arch.qcow2 | grep -v grep | awk '{ print $2}')

if [ "$pid" ]; then
	kill "$pid"
fi
