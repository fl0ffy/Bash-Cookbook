#!/bin/bash

S3_BUCKET=${S3_BUCKET}
BACKUP_DIR="BACKUP-$(date +%F)"
echo $BACKUP_DIR

if [ -d $BACKUP_DIR ]; then
  echo "Backup Directory Exists!"
  echo "Please verify backup for today not already complete."
  exit
fi

mkdir $BACKUP_DIR

for item in $(ls ${DIR_TO_BE_BACKED_UP}); do
  cp item $BACKUP_DIR/
done

tar -czvf $BACKUP_DIR.tgz $BACKUP_DIR/
aws s3 cp $BACKUP_DIR.tgz $S3_BUCKET

if [[ $(aws s3 ls ${S3_BUCKET}/${BACKUP_DIR}.tgz) ]]; then
  echo "Looks like backup is in S3!"
  echo "Removing backup directory and tarball."
  rm -rf $BACKUP_DIR
  rm -f $BACKUP_DIR.tgz
fi
