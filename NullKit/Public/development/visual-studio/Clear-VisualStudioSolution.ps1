function Clear-VisualStudioSolution {
    <#
.SYNOPSIS
Solution cleanup

.DESCRIPTION
Runs cleanup on all projects in a given directory

.PARAMETER StartPath
Start directory

.EXAMPLE
Clear-VisualStudioSolution -StartPath "C:\repo\XA\src\"
Runs solution cleanup for all projects under "C:\repo\XA\src\"

#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0 )]
        [string]$StartPath
    )

    begin {
        Write-Verbose "Cmdlet Clear-VisualStudioSolution - Begin"
        $MSBuildCall = Resolve-MsBuild
    }

    process {
        Write-Verbose "Cmdlet Clear-VisualStudioSolution - Process"
        Get-ChildItem -Path $StartPath -Recurse -ErrorAction SilentlyContinue | ? { $_.Extension -eq ".csproj" } | % {
            & $MSBuildCall $_.FullName /t:clean -verbosity:n
        }
    }

    end {
        Write-Verbose "Cmdlet Clear-VisualStudioSolution - End"
    }
}