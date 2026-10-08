#!/bin/bash

#source dir
src_dir="/home/shb/Documents/app"

#back dir
backup_dir="/home/shb/Documents/backup"

backup_info="/home/shb/Documents/backup"

#Backup app logs
rsync -avzh $src_dir $backup_dir

if [[ $? -eq 0 ]];

then
 echo "Last backup on" $(date) >> $backup_info/backup_info.txt

else
 echo "Back not completed!!" >> $backup_info/backup_info.txt

fi
