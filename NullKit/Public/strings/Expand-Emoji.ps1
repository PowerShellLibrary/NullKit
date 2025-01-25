function Expand-Emoji {
    <#
.SYNOPSIS
Unicode emoji to string

.DESCRIPTION
Expands unicode emoji deifinition to normal encoding

.PARAMETER String
Input string

.EXAMPLE
Expand-Emoji "Hey. This is emoji test \uD83D\uDE42"
Expands input string to: "Hey. This is emoji test 🙂"

#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0 )]
        [string]$String
    )
    [regex]::Unescape($String)
}