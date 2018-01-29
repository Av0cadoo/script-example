#!/bin/bash

set +e
BKNAME=backup-$(date +'%Y-%m-%d-%H').tar.gz 

if [ ! -f "dist.tar.gz" ] 
then
	echo "Not found dist.tar.gz in this directory."
	exit 1;
fi

if [ -d "backend/" ] 
then
	printf "\nCreating backup file ...\n"
	tar -zcf $BKNAME --exclude .git backend/
fi

if [ -d "dist/" ] 
then
	printf "\nRemove old dist directory ...\n"
	rm -rf dist
fi

printf "\nExtract dist.tar.gz ...\n" 
tar -xf dist.tar.gz

printf "\nLogging into deploy.log...\n"

DEPLOY_DATETIME=`date '+%Y-%m-%d %H:%M:%S %z'`
(cat dist/git.info | tr -d "\n" ; echo " | deploy time: " $DEPLOY_DATETIME) >> deploy.log
printf "\ndeploy time : $DEPLOY_DATETIME\n"

cp -a dist/. backend
printf "\nDeploy success\n"