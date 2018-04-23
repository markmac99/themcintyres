@echo off
path=%path%;c:\cygwin\bin
rsync -avz --no-p * root@thelinux:/var/www/html --exclude-from=uploadexcls.txt