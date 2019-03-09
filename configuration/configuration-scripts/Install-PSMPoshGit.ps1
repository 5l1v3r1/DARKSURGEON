﻿<#  
	.SYNOPSIS  
	Installs PoshGit from the Internet via Chocolatey. 

	.DESCRIPTION  
	Author: Dane Stuckey (@cryps1s)
	License: MIT  

	Performs a standard chocolatey installation of the most recent stable version of PoshGit. 

	.NOTES 
#>

Set-StrictMode -Version Latest

# Load the Install-PowershellModule Function 
. "$($PSScriptRoot)\Install-PowershellModule.ps1"

$PackageName = "poshgit"

Try 
{
	Install-PowershellModule -PackageName $PackageName	
}
Catch 
{
	Write-Host "Fatal erorr installing package $PackageName. Exiting."	
	Exit 1
}