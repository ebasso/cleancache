#!/bin/bash
APACHE_BIN_DIR=/opt/IBM/HTTPServer/bin
LOGFILE=/var/log/httpd/cleancache.log
CACHE_FILES=/var/cache/mod_disk_cache

# Cache Size in GB
SIZE=2;

echo "############################################" > $LOGFILE
NOW=$(date +"%Y-%m-%d-%H-%M-%S")
echo "[$NOW] Start Cleanup Cache" >> $LOGFILE
echo "" >> $LOGFILE
echo "############################################" >> $LOGFILE
df -g >> $LOGFILE
echo "############################################" >> $LOGFILE
df >> $LOGFILE
echo "############################################" >> $LOGFILE

# We must divide SIZE by the number of directories (4096),
# to get the per-directory limit, in megabytes
LIMIT=$(( $SIZE * 1024 * 1024 / 4096 ))K;

for i in $CACHE_FILES/*;
do
  NOW=$(date +"%Y-%m-%d-%H-%M-%S")
  echo "[$NOW] Diretorio $i" >> $LOGFILE
  #du -sm $i >> $LOGFILE
  $APACHE_BIN_DIR/htcacheclean -v -t -p$i -l$LIMIT >> $LOGFILE 2>&1
  #du -sm $i >> $LOGFILE
  echo "" >> $LOGFILE
done;

echo "" >> $LOGFILE
echo "############################################" >> $LOGFILE
df -g >> $LOGFILE
echo "############################################" >> $LOGFILE
df >> $LOGFILE
echo "############################################" >> $LOGFILE
NOW=$(date +"%Y-%m-%d-%H-%M-%S")
echo "[$NOW] End of Cleanup Cache" >> $LOGFILE
