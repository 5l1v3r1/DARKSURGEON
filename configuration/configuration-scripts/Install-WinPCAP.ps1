﻿<#  
	.SYNOPSIS  
	Installs WinPCAP from the Internet via Chocolatey. 

	.DESCRIPTION  
	Author: Dane Stuckey (@cryps1s)
	License: MIT

	Performs a standard chocolatey installation of the most recent stable version of WinPCAP. 

	.NOTES 
#>

Set-StrictMode -Version Latest

# Load the Install-ChocolateyPackage Function 
. "$($PSScriptRoot)\Install-ChocolateyPackage.ps1"

$PackageName = "winpcap"

Try 
{
	Install-ChocolateyPackage -PackageName $PackageName	
}
Catch 
{
	Write-Host "Fatal erorr installing package $PackageName. Exiting."	
	Exit 1
}