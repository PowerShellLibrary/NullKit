function Get-Base64 {
    <#
.SYNOPSIS
File to Base64

.DESCRIPTION
Script creates a new file with ".b64" extension and fill its content with Base64String of a file content/bytes

.PARAMETER FilePath
Full path of a file.

.EXAMPLE
Get-Base64 test.txt

#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0 )]
        $FilePath
    )
    $fileContent = Get-Content $FilePath
    $fileContentBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    $fileContentEncoded = [System.Convert]::ToBase64String($fileContentBytes)
    $fileContentEncoded | Set-Content ($FilePath + ".b64")
}