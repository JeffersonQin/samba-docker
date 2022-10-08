#!/bin/bash

sleep 2

if [ ! -f /root/configured ]; then
  # not configured
  touch /root/configured
  smbpasswd -a root
else
  # start service
  service smbd start
  # block
  /bin/bash
fi
