#!/bin/bash
# recordCam.sh
# ------------
# This script saves the live video from the Foscam IP camera to a full-quality mp4 file.
# I chose to split the files every 15 minutes (900 seconds), to quickly find the time I need.
# Note: audio is not saved as my cameras don't have a microphone connected to them.
# -----------
# Author: @LucaTNT
# License: BSD

# Uncomment this line if you're having trouble with zero-sized files (tipically happens on low end cameras), thanks Eric! (https://lucatnt.com/2014/08/record-and-archive-video-from-ip-cameras/#comment-48019)
# killall -INT ffmpeg

PATH=/usr/local/bin:$PATH
export PATH

# The file name. I use the date to make finding files easier.
name="`date +%Y-%m-%d_%H.%M`"

# Where the videos will be saved
BASEpath='/var/www/html/ipcam'
RECpath=$BASEpath'/video'

# Save the streams using ffmpeg at 30 fps, stopping the capture after 900 seconds (15 minutes). Add more lines if you have more than 2 cameras
ffmpeg -i rtsp://guest:guest@192.168.1.18:554/11 -r 5  -vcodec copy -an -t 900 $RECpath/$name.mp4 </dev/null >/dev/null 2>/tmp/cam01.log &
#ffmpeg -i rtsp://username:password@192.168.1.202:554/11 -r 5  -vcodec copy -an -t 900 $RECpath/cam02/$name.mp4 </dev/null >/dev/null 2>/tmp/cam02.log &
