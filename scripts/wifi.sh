#!/usr/bin/bash

nmcli -g n | grep "conectado to" | awk '{print $4}'