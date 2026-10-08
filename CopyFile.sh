#!/bin/bash

# Note: creat hosts file containing all server ips e.g .
#192.168.10.11
#192.168.10.12

SOURCE="$1"
TARGET="$2"
INTERIM=$(basename "$SOURCE")

[ -z "$SOURCE" ] || [ -z "$TARGET" ] && { echo "Usage: $0 <source> <target>"; exit 1; }
[ -f "$SOURCE" ] || { echo "Source file not found"; exit 1; }
[ -f "hosts" ] || { echo "Cluster file not found"; exit 1; }

for i in $(cat hosts); do
  echo "Processing $i..."
  scp -i ./shb.pem "$SOURCE" "centos@$i:~/" || { echo "SCP failed for $i"; continue; }
  ssh -t -i ./shb.pem "centos@$i" "sudo cp \"$INTERIM\" \"$TARGET\"" || { echo "SSH failed for $i"; continue; }
done