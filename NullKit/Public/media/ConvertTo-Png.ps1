[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function ConvertTo-Png {
    <#
.SYNOPSIS
Converts input to an PNG image

.DESCRIPTION
Converts input file to an PNG image

.EXAMPLE
Get-ChildItem C:\test -Filter "*.gif" | ConvertTo-Png
Converts all gif animations from location 'C:\test' into png files

#>
    begin {
        Write-Verbose "Conversion start"
    }
    process {
        $input | ConvertTo-Image -Format Png
    }
    end {
        Write-Verbose "Conversion done"
    }
}