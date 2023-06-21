$path = $(Get-Location)

if ("C:\Windows\System32" -eq $path) {
    Set-Location ~
}

Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config ~/p10k-lean.omp.json | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# Aliases
Set-Alias dk docker
Set-Alias dkc docker-compose
Set-Alias neofetch winfetch
Set-Alias ls lsAlias

# Bat
$BatConfigDir = "${env:USERPROFILE}/.bat"
$env:BAT_CONFIG_PATH = "${BatConfigDir}/bat.conf"
. "${BatConfigDir}/autocomplete/_bat.ps1"

# WSL Environment
$env:ZDOTDIR = "/home/lombervid/.config/zsh"
$env:WSLENV = "${env:WSLENV}::ZDOTDIR"

$env:GOPATH = "/home/lombervid/.local/share/go"
$env:WSLENV = "${env:WSLENV}::GOPATH"

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
function lxa {
    # Get-ChildItem -Force |
        # Format-Table -AutoSize `
    Get-ChildItem -Exclude .* |
        Format-Table `
            Mode,
            # @{Label=" "; Expression = {}},
            Sep,
            @{label = "LastWriteTime"; Expression = { $_.LastWriteTime.ToString("MM/dd/yyyy  hh:mm tt") }; Alignment = "right" },
            Sep,
            @{label = "Size"; Expression = { Format-FileSize($_.Length) }; Alignment = "right" },
            Sep,
            @{label = "File"; Expression = { $_ | Format-TerminalIcons } } `
        -HideTableHeaders

}

function info {
    # Write-Host "File info"

    # $path = ($pwd).Path

    # Write-Host $path

    # $file = [System.IO.FileInfo]$path

    # Write-Output $file | Format-Table

    [System.Array](Get-ChildItem -Exclude .* | ForEach-Object {
        # $Mode, $Length, $LastWriteTime, $Name = $_.Mode, $_.Length, $_.LastWriteTime, $_.Name

        # New-Object PSObject -Property @{
        #     "Mode"          = "${Mode}"
        #     "Length"        = "${Length}"
        #     "LastWriteTime" = "${LastWriteTime}"
        #     "Name"          = "${Name}"
        # }

        # [System.IO.FileInfo] (New-Object PSObject -Property @{
        # [System.IO.FileInfo] $_
        # [System.IO.DirectoryInfo] $_
        # $_

        # Write-Host ($_).GetType()
        # Write-Host $_.FullName

        # Write-Output $_
        # $_ | Out-String

        # if ($_ -is [System.IO.FileInfo]) {
        #     [System.IO.FileInfo] $_.FullName
        # } elseif ($_ -is [System.IO.DirectoryInfo]) {
        #     [System.IO.DirectoryInfo] $_.FullName
        # }


        $Mode, $Size, $LastWriteTime, $Name = $_.Mode, $_.Length, $_.LastWriteTime, $_.Name

        # $LastWriteTime.GetType()

        New-Object PSObject -Property @{
            "Mode"          = "${Mode}"
            # "Sep"           = ""
            "LastWriteTime" = $LastWriteTime.ToString("MM/dd/yyyy hh:mm tt")
            # "Sep2"          = ""
            "Size"          = Format-FileSize($Size)
            # "Sep3"          = ""
            "Name"          = (Format-TerminalIcons $_)
        }

        # [System.IO.FileSystemInfo] $_
        # [System.IO.FileSystemInfo] $FileInfo

        # Format-TerminalIcons($FileInfo)
        # } | Format-Table Mode, Sep, LastWriteTime, Sep2, @{Label='Size'; Expression={$_.Size}; Alignment='right'}, Sep3, Name -HideTableHeaders
    }) | Format-Table Mode, LastWriteTime, @{Label='Size'; Expression={$_.Size}; Alignment='right'}, Name
}

# Functions


# General
function ip { (Invoke-WebRequest http://ifconfig.me/ip).Content }
function version { $PSVersionTable.PSVersion }


# PHPUnit
function phpbc { php bin/console @Args }
function phpunit { vendor/bin/phpunit @Args }
function phpsunit { vendor/bin/simple-phpunit @Args }

