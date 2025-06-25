

#$Servers = Get-ADComputer -Filter { (OperatingSystem -like "*server*") -and (Enabled -eq "True") -and (Name -ne "SXAPSCCM") -and (Name -notlike "*CLS*") -and (Name -notlike "*LSTN*")  }  |Sort Name 
$Servers = Get-content .\server.txt



 ForEach ($Server in $Servers) {  
         if (Test-Connection $Server -Count 1 -Quiet) {  
                   
                   Write-Host "`n`n$Server is online!" -BackgroundColor Blue -ForegroundColor Yellow
                   $qwe=Invoke-Command -ComputerName $Server -ScriptBlock { ipconfig   }#Get-LocalGroupMember -Name 'Administrators'}#     |select Name,ObjectClass,PrincipalSource|ft}
                   $qwe >> .\qwe.txt
        }

        else{
                    #Write-Host "`n`n$Server is offline!" -BackgroundColor Red -ForegroundColor White

                    #$ServerName >> C:\Scripts\Verified\files\eksik.txt
        }

        
}