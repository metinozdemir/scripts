# Define variables
$securityGroup = "SecurityGroupName" # Replace with your security group name
$csvFilePath = "C:\users.csv" # Replace with the path to your CSV file
$errorActionPreference = "SilentlyContinue" # Optional: Suppress non-fatal errors

# Import users from CSV file
$users = Import-Csv -Path $csvFilePath | Select-Object -ExpandProperty SamAccountName

# Add users to security group
foreach ($user in $users) {
    Add-ADGroupMember -Identity $securityGroup -Members $user -ErrorAction Stop
}

# Display completion message
Write-Host "Successfully added users to security group!"


$CSV = 'C:\Temp\users.csv'
$GROUP = 'SecurityGroup'

Import-CSV -Path $CSV | 
ForEach-Object {
    $upn = $_.UserPrincipalName
    $user = Get-ADUser -Filter "UserPrincipalName -eq '$upn'" 
    Remove-ADGroupMember -Identity $GROUP -Members $user  -Confirm:$false 
} 


Get-ADGroupMember -Identity 