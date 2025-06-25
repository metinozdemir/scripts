$workspaceId = "654c79b9-81ba-4ae1-be82-618187dc1a27"
$workspaceKey = "fNyiOuexpfY9qy02xtVhZhdHgdm2dJAnhmrNmmfJRo651UwVPpM34FiJwQjVy4Y+QNjS8H0PQgFR+mc6npyd8A=="
$mma = New-Object -ComObject 'AgentConfigManager.MgmtSvcCfg'
$mma.AddCloudWorkspace($workspaceId, $workspaceKey)
$mma.ReloadConfiguration()