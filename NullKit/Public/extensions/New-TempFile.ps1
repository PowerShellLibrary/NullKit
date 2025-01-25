function New-TempFile {
    <#
.SYNOPSIS
Creates a temporary file.

.DESCRIPTION
The New-TempFile cmdlet creates an empty file that has the .tmp file name extension. This cmdlet names the file `tmp`NNNN`.tmp`, where NNNN is a random hexadecimal number.
The cmdlet creates the file in your $Env:Temp folder.

.EXAMPLE
$tempFile = New-TempFile

#>
    if ($PSVersionTable.PSVersion.Major -ge 5) {
        return New-TemporaryFile
    }
    else {
        return (New-Item -ItemType File -Path $env:TEMP -Name (New-Guid).Guid)
    }
}
