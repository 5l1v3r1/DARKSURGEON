﻿<#  
.SYNOPSIS  
Installs AzurePowershell from the Internet via Chocolatey. 

.DESCRIPTION  
Author: Dane Stuckey (@cryps1s)
License: MIT  

Performs a standard chocolatey installation of the most recent stable version of AzurePowershell. 

.NOTES 
#>

Set-StrictMode -Version Latest
[String]$PackageName = "windowsazurepowershell"
[Int]$RetryCounter = 0
[Int]$RetryMax = 3 
[Int]$SleepCounter = 30

Try
{
	Do
	{
		# Try to Install Package
		$Process = Start-Process -FilePath "choco.exe" -ArgumentList "install","$PackageName","--limit-output" -NoNewWindow -PassThru -Wait 
		
		# If not a successful exit code, retry
		If ($Process.ExitCode -ne 0)
		{
			$RetryCounter += 1 
			Write-Host "[!] Failed to install package $PackageName. Attempt $RetryCounter out of $RetryMax. Sleeping for $SleepCounter seconds before next retry."
			Start-Sleep -Seconds $SleepCounter
		}
	} Until (($Process.ExitCode -eq 0) -or ($RetryCounter -eq $RetryMax))

	If (($Process.ExitCode -ne 0))
	{
		Write-Host "[!] Failed to install $PackageName after $RetryMax attempts. Throwing fatal error and exiting."
		Write-Host $_.Exception | format-list -force
		Exit 1
	}
}
Catch
{
	Write-Host "[!] Error occurred attempting to install $PackageName. Exiting."
	Write-Host $_.Exception | format-list -force
	Exit 1
}