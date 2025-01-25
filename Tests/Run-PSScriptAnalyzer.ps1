Import-Module PSScriptAnalyzer

$Public = Get-ChildItem -Path "$PSScriptRoot\..\NullKit\Public" -Recurse -Filter "*.ps1"

$Public | % { Invoke-ScriptAnalyzer -Path $_.fullname -Settings $PSScriptRoot\PSScriptAnalyzerSettings.psd1 }