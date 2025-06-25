$OU = 'DC=sunexpress,DC=com,DC=tr'
# Get adgroups from specific OU
$adGroups =  Get-ADGroup -Filter * -SearchBase $OU

# Iterate through adgroups and get ad group name and user name
$adGroupMembers = foreach ($Group in $adGroups) {
    Get-ADGroupMember -Identity $Group -Recursive | Select-Object @{Name='Group';Expression={$Group.Name}}, @{Name='Member';Expression={$_.Name}}
}
# export ad group name and user to csv file
$adGroupMembers | Export-Csv -Path c:\adGroupMembers.csv -NoTypeInformation