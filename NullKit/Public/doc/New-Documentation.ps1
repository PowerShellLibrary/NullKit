function New-Documentation {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, Position = 0 )]
        [string]$ModuleName,
        [Parameter(Mandatory = $false, Position = 1 )]
        [string]$OutputFolderPath = (Get-Location)
    )

    $parametersProperties = @(
        'DefaultValue',
        'ParameterValue',
        'PipelineInput',
        'Position',
        'Required'
    )

    $NL = [System.Environment]::NewLine
    $scriptStart = "``````PowerShell$NL"
    $scriptEnd = "$NL``````"

    $outputFile = (New-TemporaryFile).FullName
    foreach ($cmd in (Get-Command -Module $ModuleName).Name ) {
        Write-Verbose "Generating documentation for $($cmd)"
        $help = Get-Help $cmd -ErrorAction 'SilentlyContinue'
        "$NL## " + $cmd | Out-File -FilePath $outputFile -Append

        if ($help.Synopsis) {
            "$NL### .SYNOPSIS" | Out-File -FilePath $outputFile -Append
            $NL + $help.Synopsis | Out-File -FilePath $outputFile -Append
        }

        if ($help.Syntax) {
            "$NL### .SYNTAX" | Out-File -FilePath $outputFile -Append
            $NL + $scriptStart + ($help.Syntax | Out-String).trim() + $scriptEnd | Out-File -FilePath $outputFile -Append
        }

        if ($help.Description) {
            "$NL### .DESCRIPTION" | Out-File -FilePath $outputFile -Append
            $NL + $help.Description.Text | Out-File -FilePath $outputFile -Append
        }

        if ($help.Parameters) {
            "$NL### .PARAMETERS" | Out-File -FilePath $outputFile -Append
            forEach ($item in $help.Parameters.Parameter) {
                "$NL### ``-" + $item.name + "``" | Out-File -FilePath $outputFile -Append
                if ($item.Description.Text) {
                    $NL + $item.Description.Text | Out-File -FilePath $outputFile -Append
                }
                "$NL|||" | Out-File -FilePath $outputFile -Append
                '|-|:-|' | Out-File -FilePath $outputFile -Append
                "|**Type**: |$($item.Type.Name)|" | Out-File -FilePath $outputFile -Append
                forEach ($p in $parametersProperties) {
                    if ($item.$p) {
                        "|**$p**: |$($item.$p)|" | Out-File -FilePath $outputFile -Append
                    }
                }
            }
        }

        if ($help.Examples) {
            "$NL## Examples" | Out-File -FilePath $outputFile -Append
            forEach ($item in $help.Examples.Example) {
                "$NL### " + $item.title.Replace('-', '').Replace(' EXAMPLE', 'Example') | Out-File -FilePath $outputFile -Append
                if ($item.Code) {
                    $NL + $scriptStart + $item.Code + $scriptEnd | Out-File -FilePath $outputFile -Append
                }
            }
        }
    }

    try {
        $finalFileName = "$OutputFolderPath\$ModuleName.md"
        [System.Io.File]::ReadAllText($outputFile) | Out-File -FilePath $finalFileName -Encoding utf8
    }
    finally {
        Remove-Item $outputFile -Force
    }
}