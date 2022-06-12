#!/bin/bash
for i in -fforce-mem -fthread-jumps -fcse-follow-jumps -fcse-skip-blocks -fregmove; do sed -i -e s/$i//g Makefile; done
