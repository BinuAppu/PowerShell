DHCP Log Backup
==============

Following is a PowerShell script which will allow you to take a backup of DHCP Log locally.

As you are aware DHCP will overwrite logs on Weekly basis. If you have a policy to retain any logs for certain days, this script will come to your help a lot.

You need to schedule this Script to run on daily basis. Script will take the backup of both IPv4 and IPv6 logs of previous day. Script will provide you option to set Destination path for the backup, which can configure by editing the script.