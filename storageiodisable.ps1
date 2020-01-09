$datastore = Get-View -ViewType Datastore -Filter @{"Name" = "NameOfDatastore"}

foreach($datastorevalue in $datastore.MoRef){
$spec = New-Object VMware.Vim.StorageIORMConfigSpec
$spec.enabled = $false
$spec.congestionThreshold = 30

$_this = Get-View -Id 'StorageResourceManager-StorageResourceManager'
$_this.ConfigureDatastoreIORM_Task($datastorevalue, $spec)
}
