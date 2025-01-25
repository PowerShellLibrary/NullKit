function Get-StringHash {
    <#
.SYNOPSIS
Returns hash from a string

.DESCRIPTION
Returns hash from an input string using given hash algorithm.
Default algorithm is:  'MD5'

.PARAMETER String
String to be hashed

.PARAMETER HashName
Hash algorithm name

.EXAMPLE
Get-StringHash "test"
Returns hash from string 'test'

.EXAMPLE
Get-StringHash 'test' -HashName "sha256"
Returns hash from string 'test' using 'sha256' algorithm

#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$String,
        [Parameter(Mandatory = $false, Position = 1)]
        [String]$HashName = "MD5"
    )

    process {
        $StringBuilder = New-Object System.Text.StringBuilder
        [System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String)) | % {
            [Void]$StringBuilder.Append($_.ToString("x2"))
        }
        $StringBuilder.ToString()
    }
}
