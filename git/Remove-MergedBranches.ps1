function Remove-MergedBranches {
    <#
.SYNOPSIS
Helper script for removing merged branches

.DESCRIPTION
This script will remove all branches which were already merged to the current branch

.PARAMETER Branches
Collection of excluded from removing branches

.EXAMPLE
Remove-MergedBranches
Removes all merged branches except default branches: master, develop

.EXAMPLE
Remove-MergedBranches -Branches naster,feature1
Removes all merged branches except specified branches: master, feature1
#>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory = $false)]
        [string[]]$Branches = @("master", "develop")
    )

    process {
        Get-MergedBranchces $Branches | % {
            $branch = $_
            if ($PSCmdlet.ShouldProcess($branch)) {
                git branch -d $branch
            }
        }
    }
}