$workspaceId = "24c3e3dc-bf9d-43e8-a97b-1e086d4f6694"
$mma = New-Object -ComObject 'AgentConfigManager.MgmtSvcCfg'
$mma.RemoveCloudWorkspace($workspaceId)
$mma.ReloadConfiguration()