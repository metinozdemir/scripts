(((Get-HotFix).HotFixID) -contains 'KB5019966') -or (((Get-HotFix).HotFixID) -contains 'KB5020010') -or (((Get-HotFix).HotFixID) -contains 'KB5020003')


$computers = Get-Content -Path "servernamepure.txt"
 $results=foreach ($computer in $computers)
     {
      #Invoke-Command -ComputerName $computer -ScriptBlock{Get-LocalGroupMember -Name 'Administrators'} |Select-Object PSComputerName,Name
      Invoke-Command -ComputerName $computer -ScriptBlock{ Get-HotFix -id KB5020374|select-object InstalledOn,PSComputerName}
     }

$results | Export-CSV -Path .\rdps.txt -NoTypeInformation -append

Get-HotFix -ComputerName sxsysopstest02 -id KB5020374
