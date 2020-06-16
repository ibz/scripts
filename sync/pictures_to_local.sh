#!/usr/bin/bash

if [ -z "`mount | grep /mnt/pictures`" ]; then
    echo "Not mounted!"
    exit 1
fi

rsync -rv --delete /mnt/pictures/Pictures/ ~/Pictures/

