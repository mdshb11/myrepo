
# 1. Instant Disk Health Check
#!/bin/bash
echo "Disk Usage Summary:"
df -h | awk '$5+0 > 70 {print $0}' | tee disk_alert.txt
# Why? Spot partitions above 70% usage — avoid surprises in prod!

#2. Detect High CPU Usage in One Command
#!/bin/bash
echo " High CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
# Why? Quickly pinpoint which process is hogging your server.

# 3. Clean Up Old Logs (7+ days)
#!/bin/bash
LOG_DIR="/var/log"
find $LOG_DIR -type f -name "*.log" -mtime +7 -exec rm -f {} \;
echo "Old log files removed from $LOG_DIR"
# Why? Automate hygiene. Free up space before issues hit.