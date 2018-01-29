#!/bin/bash

BKNAME=backup-$(date +'%d-%m-%Y-%H').tar.gz
tar -zcvf $BKNAME $1
