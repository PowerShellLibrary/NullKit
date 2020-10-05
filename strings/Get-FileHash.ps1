function Get-FileHash {
    <#
.SYNOPSIS
Returns hash from a file

.DESCRIPTION
Returns hash from a file using given hash algorithm.
Default algorithm is:  'MD5'

.PARAMETER FileName
 Name/path of the file to be hashed

.PARAMETER HashName
Hash algorithm name

.EXAMPLE
Get-FileHash README.md
Returns hash from "README.md" file, which is located in the current directory

.EXAMPLE
Get-FileHash "C:\README.md"
Returns hash from "README.md" file, which is location is "C:\README.md"

.EXAMPLE
Get-FileHash README.md -HashName "sha256"
Returns hash from "README.md" file, which is located in the current directory using 'sha256' algorithm

#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$FileName,
        [Parameter(Mandatory = $false, Position = 1)]
        [String]$HashName = "MD5"
    )

    process {
        if (!(Test-Path $FileName)) {
            $curLoc = Get-Location
            $FileName = Join-Path $curLoc $FileName
        }
        if (!(Test-Path $FileName)) {
            Write-Error "Could not find file $FileName"
            exit
        }
        $FileName = Get-Item -Path $FileName
        $FileStream = New-Object System.IO.FileStream($FileName, [System.IO.FileMode]::Open)
        $StringBuilder = New-Object System.Text.StringBuilder
        [System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash($FileStream) | % { [Void]$StringBuilder.Append($_.ToString("x2")) }
        $FileStream.Close()
        $FileStream.Dispose()
        $StringBuilder.ToString()
    }
}
