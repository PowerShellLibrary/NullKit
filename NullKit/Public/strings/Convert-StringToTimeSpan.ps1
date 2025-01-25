function Convert-StringToTimeSpan {
    <#
.SYNOPSIS
Converts string to TimeSpan

.DESCRIPTION
Converts input string to timespan object

.PARAMETER Arg1
Input string to be converted

.EXAMPLE
Convert-StringToTimeSpan "00:00:00.0040507"
Converts "00:00:00.0040507" into TimeSpan object

#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)]
        [string]$String
    )
    [timespan]$String
}