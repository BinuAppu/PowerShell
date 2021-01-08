<#
Script - This Script will help you take the backup of previous days DHCP logs.
Created -Jan 18, 2021
Author - Binu Balan
#>

cls
$host.ui.RawUI.WindowTitle = “APPU - DHCP Log Backup”
Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host " "
Write-host "                 _    ____  ____  _   _ "
Write-host "                / \  |  _ \|  _ \| | | |"
Write-host "               / _ \ | |_) | |_) | | | |"
Write-host "              / ___ \|  __/|  __/| |_| |"
Write-host "             /_/   \_\_|   |_|    \___/ "
Write-Host " " 
Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host " " 
Write-host "	           .__." -ForegroundColor Green
Write-host "                   (oo)____" -ForegroundColor Green
Write-host "                   (__)    )\" -ForegroundColor Green
Write-host "                      ll--ll '" -ForegroundColor Green
Write-Host "               SCRIPT BY BINU BALAN               " -ForegroundColor DarkRed -BackgroundColor White 
Write-Host "<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>" -ForegroundColor Cyan
Write-Host ""
Write-Host "My other Scripts : http://goo.gl/CrUsnW" -ForegroundColor DarkCyan
Write-Host ""  
Write-Host ""

Start-Sleep -Seconds 3

# Define the backup destination 
# =============================
$DHCPLogPath = "C:\Windows\system32\dhcp"
$DHCPLogBackupPath = "C:\DHCPLogPath"
$checkfolder = Test-Path $DHCPLogBackupPath
if ($checkfolder){
    # Do Nothing
    Write-Host "[Found] " -ForegroundColor Green -NoNewline
    Write-Host "Folder available"
} Else {
    mkdir $DHCPLogBackupPath
}

$YesterdayDate = (Get-Date).AddDays(-1)
$DayOfWeek = $YesterdayDate.DayOfWeek

$FindVal = switch ($DayOfWeek)
{
    'Monday' {"Mon"}
    'Tuesday' {"Tue"}
    'Wednesday' {"Wed"}
    'Thursday' {"Thu"}
    'Friday' {"Fri"}
    'Saturday' {"Sat"}
    'Sunday' {"Sun"}
}

Write-Host "Yesterdays date : "$FindVal
$IP4 = "DhcpSrvLog-$FindVal.log"
$IP6 = "DhcpV6SrvLog-$FindVal.log"

#Source File Name
$DHCPIP4LogName = "$DHCPLogPath\$IP4"
$DHCPIP6LogName = "$DHCPLogPath\$IP6"

#Date 
$Ydate= (get-date).AddDays(-1).ToString("MM_dd_yyyy")

#Destination File Name
$DHCPIP4LogBackup = "$DHCPLogBackupPath\$Ydate.$IP4"
$DHCPIP6LogBackup = "$DHCPLogBackupPath\$Ydate.$IP6"

Copy-Item $DHCPIP4LogName $DHCPIP4LogBackup
Copy-Item $DHCPIP6LogName $DHCPIP6LogBackup

#End of Script.