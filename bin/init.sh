#!/bin/bash

ROOT_DIR=$(cd "$(dirname "$0")"; cd ..; pwd)

# 设置所有者
CHOWN="www:www"
if [ -n "$1" ] ;then
    CHOWN=$1
fi

groupadd www
useradd -g www www -s /sbin/nologin

mkdir -p /data/wwwroot
mkdir -p /data/wwwlogs
chown -R $CHOWN ./wwwroot
chown -R $CHOWN /data/wwwlogs

rm -rf $ROOT_DIR/logs/wwwlogs
rm -rf $ROOT_DIR/wwwroot

ln -s /data/wwwroot $ROOT_DIR/wwwroot
ln -s /data/wwwlogs $ROOT_DIR/logs/wwwlogs

