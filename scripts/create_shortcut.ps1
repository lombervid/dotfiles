#! /usr/bin/env pwsh

<#
 # Create Shortcut
 # https://learn.microsoft.com/en-us/answers/questions/1163030/how-to-create-a-shortcut-to-a-folder-with-powershe
 # https://learn.microsoft.com/en-us/troubleshoot/windows-client/admin-development/create-desktop-shortcut-with-wsh
 #>
[CmdletBinding()]
param (
    [Parameter(HelpMessage = "Enter shortcut name")]
    [string]
    $Name,

    [Parameter(Mandatory, HelpMessage = "Enter path where the target is located")]
    [Alias("target")]
    [ValidateScript({
            if (Test-Path -Path $_ -PathType Leaf) {
                $true
            }
            else {
                throw "Path '$_' is not a file."
            }
        })]
    [System.IO.FileInfo]
    $TargetPath,

    [Parameter(HelpMessage = "Enter path where the icon is located")]
    [Alias("icon")]
    [ValidateScript({
            if ( -not (Test-Path -Path $_ -PathType Leaf) ) {
                throw "Path '$_' is not a file."
            }
            $true
        })]
    [System.IO.FileInfo]
    $IconLocation
)

# Stop script on error
Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

# Start Menu path
Set-Variable -Name "StartMenuPath" -Value "${env:APPDATA}/Microsoft/Windows/Start Menu/Programs"  -Option Constant -Scope "script"

if ( -not $PSBoundParameters.ContainsKey('Name') ) {
    $Name = Split-Path $TargetPath -leafBase
}

$shell = New-Object -comObject WScript.Shell
$shortcut = $shell.CreateShortcut("${StartMenuPath}/${Name}.lnk")
$shortcut.TargetPath = "${TargetPath}"

if ( $PSBoundParameters.ContainsKey('IconLocation') ) {
    $shortcut.IconLocation = "${IconLocation}"
}

$shortcut.Save()
