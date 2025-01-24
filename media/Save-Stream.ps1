function Invoke-WithoutProgress {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [scriptblock] $ScriptBlock
    )

    $prevProgressPreference = $global:ProgressPreference
    $global:ProgressPreference = 'SilentlyContinue'

    try {
        . $ScriptBlock
    }
    finally {
        $global:ProgressPreference = $prevProgressPreference
    }
}

function Save-Stream {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)]
        [string]$M3UPlaylistUrl
    )

    if ([string]::IsNullOrWhiteSpace($M3UPlaylistUrl)) {
        return
    }

    $baseUrl = Split-Path $M3UPlaylistUrl
    $baseUrl = $baseUrl.Replace("\", "/")
    $location = Get-Location

    $indexList = (Invoke-WebRequest -Uri $M3UPlaylistUrl).RawContent.Split("`n") `
    | ? { $_ -ne "" } `
    | Skip-While { $_.StartsWith("#EXTM3U") -eq $false } `
    | ? { -not $_.StartsWith("#") } `
    | % { "$baseUrl/$_" }

    $i = 0
    $totalItems = $indexList.Count
    $percentComplete = 0
    $indexList | % {
        Write-Progress -Activity "Saving stream" -Status "Processing part $i of $totalItems" -PercentComplete $percentComplete
        Invoke-WithoutProgress {
            Write-Host  "$location\$i.ts"
            Invoke-WebRequest -Uri $_ -OutFile "$location\$i.ts"
        }
        # $i++
        $percentComplete = ($i++ / $totalItems) * 100
    }

}