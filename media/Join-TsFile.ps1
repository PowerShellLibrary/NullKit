function Join-TsFile {
    <#
.SYNOPSIS
Concatenates .ts video files in a specified location into a single output file

.DESCRIPTION
This cmdlet concatenates .ts video files from a specified directory or a list of files into a single output file. The files are processed in chunks to avoid command line length limitations, making the script suitable for handling a large number of files. If a FilesLocation is provided, it sorts the .ts files by creation time. If Files are provided, it uses that list instead. The output file is named "out.ts" by default.

.PARAMETER FilesLocation
The path to the directory containing the .ts files to concatenate. If not specified, the cmdlet will use the files provided in the -Files parameter.

.PARAMETER Files
An array of System.IO.FileInfo objects representing the .ts files to concatenate. If specified, this parameter overrides FilesLocation.

.PARAMETER OutFile
The name of the output file. By default, this is set to "out.ts".

.PARAMETER ChunkSize
The number of files to process in each chunk. This helps to avoid exceeding the command line length limit when concatenating files.

.PARAMETER UseFFmpeg
Use FFMPEG to join files instead of build in copy command.

.EXAMPLE
Join-TsFile "c:\test\"
Joins all *.ts files found in a "c:\test\" directory

.EXAMPLE
Join-TsFile -Files (gci "c:\test\2")
Joins all files passed as with Files argument

.NOTES
The cmdlet changes the current location to the directory specified by FilesLocation and restores the original location after the operation is complete.
If the total command length is too long for the cmd /c copy operation, reducing the ChunkSize may help avoid errors.

#>
    param (
        [Parameter(Mandatory = $false, Position = 0)]
        [string]$FilesLocation,
        [Parameter(Mandatory = $false, Position = 1)]
        [System.IO.FileInfo[]]$Files,
        [Parameter(Mandatory = $false, Position = 2)]
        [string]$OutFile = "out.ts",
        [Parameter(Mandatory = $false, Position = 3)]
        [int]$ChunkSize = 1000,
        [Parameter(Mandatory = $false, Position = 4)]
        [switch]$UseFFmpeg
    )

    function Test-FFmpegInstalled {
        return Get-Command ffmpeg -ErrorAction SilentlyContinue -OutVariable +Null
    }

    $location = Get-Location
    try {
        if (![string]::IsNullOrWhiteSpace($FilesLocation)) {
            $fileNames = Get-ChildItem -Path $FilesLocation -Filter "*.ts" | Sort-Object -Property CreationTime | % { $_.Name }
        }
        if ($Files) {
            $fileNames = $Files.Name
            $tsFile = $Files | Select-Object -First 1
            $FilesLocation = $tsFile.Directory
        }

        $fileNames = $fileNames | ? { $_ -ne $OutFile }

        Set-Location $FilesLocation

        if ($UseFFmpeg -and (Test-FFmpegInstalled)) {
            $tmpFilePath = Join-Path -Path (Get-Location).Path -ChildPath "_fileList.txt"
            $fileNames | % { "file '$($_)'" } | Set-Content -Path $tmpFilePath
            ffmpeg -f concat -safe 0 -i $tmpFilePath -c copy $OutFile -loglevel quiet
            Remove-Item -Path $tmpFilePath
        }
        else {
            Copy-Item -Path $fileNames[0] -Destination $OutFile
            for ($i = 1; $i -lt $fileNames.Count; $i += $ChunkSize) {
                $chunk = $fileNames[$i..([math]::Min($i + $ChunkSize - 1, $fileNames.Count - 1))]
                $concatenatedNames = $chunk -join "+"
                cmd /c copy /b "$OutFile+$concatenatedNames" $OutFile | Out-Null
            }
        }
    }
    finally {
        Set-Location $location
    }
}