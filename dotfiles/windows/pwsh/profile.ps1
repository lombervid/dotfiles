$path = $(Get-Location)

if ("C:\Windows\System32" -eq $path) {
    Set-Location ~
}

Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config ~/p10k-lean.omp.json | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# Set completion as list
Set-PSReadLineOption -PredictionViewStyle ListView

# Aliases
Set-Alias dk docker
Set-Alias dkc docker-compose
Set-Alias neofetch winfetch
Set-Alias ls lsAlias

# Add user/bin to PATH
$env:PATH = "${env:USERPROFILE}/bin;${env:PATH}"

# Add Go to path
$env:GOPATH = "${env:USERPROFILE}/.config/go"
$env:GOBIN = "${env:GOPATH}/bin"
$env:PATH = "${env:PATH};E:\bin\go\bin;${env:GOPATH}/bin"

# Add PHP to path
$env:PATH = "${env:PATH};E:\bin\php"


# Bat
$BatConfigDir = "${env:USERPROFILE}/.bat"
$env:BAT_CONFIG_PATH = "${BatConfigDir}/bat.conf"
. "${BatConfigDir}/autocomplete/_bat.ps1"

# WSL Environment
$env:ZDOTDIR = "/home/${env:USERNAME}/.config/zsh"
$env:WSLENV = "${env:WSLENV}::ZDOTDIR"

# $env:GOPATH = "/home/lombervid/.local/share/go"
# $env:WSLENV = "${env:WSLENV}::GOPATH"

# Git Bash
function gitbash() {
    & "C:\Program Files\Git\bin\bash.exe" --cd=$(Get-Location)
}

# ls
function Get-List {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path,

        [switch] $Hidden,
        [switch] $DotFiles,
        [switch] $ListFormat
    )

    Begin {
        if ( -not $Path ) {
            $Path = "$(Get-Location)"
        }
    }

    Process {
        $options = @{
            LiteralPath = ${Path}
        }

        if ($Hidden) {
            $options['Force'] = $true
        } elseif ( -not $DotFiles) {
            $options['Exclude'] = ".*"
        }

        $list = $(Get-ChildItem @options)

        if ($ListFormat) {
            $list = $list | Format-Wide -AutoSize
        }

        $list
    }
}

function lsl {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path -DotFiles -ListFormat
}

function lsa {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path -Hidden -ListFormat
}

function lsAlias {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path -ListFormat
}

function l {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path
}

function ll {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path -DotFiles
}

function la {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [System.IO.FileInfo]
        $Path
    )
    Get-List -Path $Path -Hidden
}

function Format-FileSize() {
    Param ([int64]$size)
    If ($size -gt 1TB) { [string]::Format("{0:0.0}TB", $size / 1TB) }
    ElseIf ($size -gt 1GB) { [string]::Format("{0:0.0}GB", $size / 1GB) }
    ElseIf ($size -gt 1MB) { [string]::Format("{0:0.0}MB", $size / 1MB) }
    ElseIf ($size -gt 1KB) { [string]::Format("{0:0}kB", $size / 1KB) }
    ElseIf ($size -gt 1) { [string]::Format("{0:0}", $size) }
    Else { "" }
}

function Find-Command() {
    param ([string]$commandName)

    return [bool]   (Get-Command $commandName -ErrorAction SilentlyContinue)
}


# Functions


# General
function ip { (Invoke-WebRequest http://ifconfig.me/ip).Content }
function version { $PSVersionTable.PSVersion }


# PHPUnit
function phpbc { php bin/console @Args }
function phpunit { vendor/bin/phpunit @Args }
function phpsunit { vendor/bin/simple-phpunit @Args }

# Fast Node Manager (fnm)
if (Find-Command -commandName 'fnm') {
fnm env --use-on-cd | Out-String | Invoke-Expression
fnm completions --shell powershell | Out-String | Invoke-Expression
}

