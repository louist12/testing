$file = "C:\Users\jusma\Desktop\pwrs1\file.ps1"
$ftpuri = "ftp://testadmin:testpassword@192.119.71.89/file.ps1"
$webclient = New-Object System.Net.WebClient
$uri = New-Object System.Uri($ftpuri)
$webclient.UploadFile($uri, $file)