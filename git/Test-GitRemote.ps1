function Test-GitRemote {
    <#
.SYNOPSIS
Scans git directories and displays remotes information

.DESCRIPTION
Scans git directories and displays git remotes information with verbose option.
It provides following information:

origin  git@github.com:alan-null/test.git (fetch)
origin  git@github.com:alan-null/test.git (fetch)

.PARAMETER DirectoryPath
Root dir containing other git repo folders

.EXAMPLE
Test-GitRemote
Iterates through folders in a current directory and displays git status of each repo

.EXAMPLE
Test-GitRemote c:\repo
Iterates through folders from a 'c:\repo' directory and displays git status of each repo
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)]
        [string]$DirectoryPath
    )

    # begin {
    #     Import-Module posh-git
    # }

    process {
        if (!$DirectoryPath) {
            $DirectoryPath = Get-Location
        }
        $revertPath = Get-Location

        try {
            Get-ChildItem $DirectoryPath | ? { $_.PSIsContainer } | % {
                $dir = $_.FullName

                Set-Location $dir
                $git = Get-GitStatus

                if ($git.GitDir) {
                    Write-Host $dir -ForegroundColor Green
                    git remote -v
                    Write-Host ""
                }
            }
        }
        finally {
            Set-Location $revertPath
        }
    }
}