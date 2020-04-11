$moduleName     = $env:ModuleName
$modulesPath    = $env:PSModulePath -split ";" | Select-Object -First 1
$source         = (Get-Item .).FullName
$exclude        = @('\.git', '.vscode', , "ci\\*", "Run-PSScriptAnalyzer.ps1", "PSScriptAnalyzerSettings.psd1", "CMDLET_TEMPLATE.ps1")

$all = Get-ChildItem -Recurse
$excluded = $all | ? {
    $path = $_.FullName
    $filter = $exclude | ? { $path -match $_ }
    $filter.Count -eq 0
}

Write-Host "Filtered artifacts" -ForegroundColor Yellow
Compare-Object -ReferenceObject $all.FullName -DifferenceObject $excluded.FullName `
    | % { $_.InputObject } `
    | Sort-Object `
    | % { Write-Host $_ -ForegroundColor DarkYellow }

if ($moduleName) {
    mkdir "$modulesPath\$moduleName" | Out-Null
    $modulesPath = "$modulesPath\$moduleName"

    $excluded | Copy-Item -Destination { Join-Path $modulesPath $_.FullName.Substring($source.length) }
    Publish-Module -Name $moduleName -NuGetApiKey $env:NuGetApiKey
}