
$Service="EventLog"


Set-service -name $Service -StartupType Disabled
Stop-Service $Service -Force

Remove-Item -Path "C:\Program Files\VMware" -Recurse




Set-service -name $Service -StartupType Automatic
Start-Service $Service
