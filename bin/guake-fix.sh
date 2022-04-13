#!/bin/bash -f
set -e
d=/usr/share/applications
f=guake.desktop
t=../guake/autostart-guake.desktop
echo "current link state:"
ls -l $d/$f
cd $d
if [ -L $f -a \! -a $f -a -a $t ]; then
    echo "Swizzling bad link:"
    ln --force --symbolic --verbose $t $f
else
    echo "Aborting swizzle."
    exit 1
fi

