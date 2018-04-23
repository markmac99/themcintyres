@echo off
path=%path%;c:\cygwin\bin
rsync -avz --no-p mark@thelinux:/var/www/html/* . --exclude-from=excludes.txt