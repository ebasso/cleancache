# cleancache
Cleanup script for mod cache

If you are using mod_cache/mod_disk_cache to use disk cache on Apache/IBM HTTP Server, you must run htcacheclean to cleanup cache to not be out of space.

htcacheclean takes too much time to run. So i create a script that run htcacheclean against sub-directories, this way the command run faster.

1) Download cleancache.sh

2) Change permission

chmod a+x cleancache.sh

3) Putting on Cron:

Edit crontab using crontab -e

Add the following lines

###### Script de Limpeza do Cache do IBM HTTP Server######
0 4 * * 6 /opt/IBM/HTTPServer/bin/cleancache.sh
