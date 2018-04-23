#!/bin/bash
cd /var/www/html/ipcam/images
x=1
while [ $x -gt 0 ]
do
fn=`date '+%Y%m%d'`
if [ ! -e $fn ] 
then 
  mkdir $fn
fi
wget http://guest:guest@192.168.1.18/tmpfs/auto.jpg -O $fn/S`date '+%Y%m%d%H%M%S'`.jpg
sleep 30
done
