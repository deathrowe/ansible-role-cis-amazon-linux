#!/bin/bash

for dir in `cat /etc/passwd | egrep -v '(root|ec2-user|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do
  for file in $dir/.rhosts; do
    if [ ! -h "$file" -a -f "$file" ]; then
      echo ".rhosts file in $dir"
    fi
  done
done
