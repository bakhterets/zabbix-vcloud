<#
Version 1.0

Description: Script creates and removes VM.

Ilia Bakhterev
bakhterets@gmail.com
#>
# Options
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('CreateVM','RemoveVm','Check')]
    [string]
    $Action
  )

# Variables

$creationlog =  "$PSScriptRoot\creationlog"
$removallog = "$PSScriptRoot\removallog"
$procedurelog = "$PSScriptRoot\procedurelog"

# Functions

function CreateVm {
  try {
    Write-Output "Start of vm creation procedure"

    Write-Output "Set vm parameters"

    Write-Output "Run vm creation" 
    Set-Location "C:\scripts\vcloudcheck"
    .\terraform.exe apply -auto-approve
    ("1" | Out-File -FilePath $creationlog)

  }
  catch {
    ("0" | Out-File -FilePath $creationlog)
  }
}

function RemoveVm {
    try {
      Write-Output "Start of vm removal procedure"
      Set-Location "C:\scripts\vcloudcheck"
      .\terraform.exe apply -auto-approve
      Write-Output "Removing a vm"
      # vm remove
      ("1" | Out-File -FilePath $removallog)
    }
    catch {
      ("0" | Out-File -FilePath $removallog)
    }
}

function Test-vCloudCheck {
  
  try {
    CreateVm
    Start-Sleep -Seconds 30
    RemoveVm
    ("1" | Out-File -FilePath $procedurelog)
  }
  catch {
    ("0" | Out-File -FilePath $procedurelog)
  }
}

switch ($Action) {
  CreateVm { CreateVm }
  RemoveVM { RemoveVm }
  Check { Test-vCloudCheck }
  Default { "Unknown error" }
}