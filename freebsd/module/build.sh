#!/bin/sh

SRC="$1"
# XXXX Netflix
if [ -z "$SRC" ]; then
	SRC=$(cd "../../../FreeBSD/" && pwd)
fi

shift

DBG='DEBUG_FLAGS=-g'
echo "The FreeBSD source tree is at $SRC ..."
make -m $SRC/share/mk SYSDIR=$SRC/sys  $DBG clean cleandepend
if [ $1 = "clean" ]; then
	exit
fi
make -m $SRC/share/mk SYSDIR=$SRC/sys  $DBG depend
make -m $SRC/share/mk SYSDIR=$SRC/sys  $DBG all -j12
#make -m $SRC/share/mk SYSDIR=$SRC/sys  $DBG install

