#!/bin/bash

if [[ $(ip a | grep "tun0") ]]; then echo 'VPN: ON'; else echo 'VPN: OFF';fi
