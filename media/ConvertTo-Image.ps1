enum ImageFormat { MemoryBMP; Bmp ; Emf; Wmf; Jpeg; Png; Gif; Tiff; Exif; PhotoCD; Icon }

function Get-ImageFormat {
    param (
        $format
    )
    switch ($format) {
        "MemoryBMP" { [System.Drawing.Imaging.ImageFormat]::MemoryBMP }
        "Bmp" { [System.Drawing.Imaging.ImageFormat]::Bmp }
        "Emf" { [System.Drawing.Imaging.ImageFormat]::Emf }
        "Wmf" { [System.Drawing.Imaging.ImageFormat]::Wmf }
        "Jpeg" { [System.Drawing.Imaging.ImageFormat]::Jpeg }
        "Png" { [System.Drawing.Imaging.ImageFormat]::Png }
        "Gif" { [System.Drawing.Imaging.ImageFormat]::Gif }
        "Tiff" { [System.Drawing.Imaging.ImageFormat]::Tiff }
        "Exif" { [System.Drawing.Imaging.ImageFormat]::Exif }
        "Icon" { [System.Drawing.Imaging.ImageFormat]::Icon }
        Default { }
    }
}

function ConvertTo-Image {
    <#
.SYNOPSIS
Converts input to an image

.DESCRIPTION
Converts input file to an image. Supported output types: MemoryBMP, Bmp , Emf, Wmf, Jpeg, Png, Gif, Tiff, Exif, PhotoCD, Icon

.PARAMETER Files
Input files

.PARAMETER Format
Output Image format type

.EXAMPLE
Get-ChildItem C:\test -Filter "*.gif" | ConvertTo-Image -Format Png
Converts all gif animations from location 'C:\test' into png files

#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true)]
        $Files,
        [ImageFormat]
        [Parameter(Mandatory = $true, Position = 1)]
        $Format
    )

    begin {
        Write-Verbose "Conversion start"
    }
    process {
        $formatType = Get-ImageFormat $Format
        $fullName = $input.FullName
        $image = [System.Drawing.Image]::FromFile($fullName);
        $filePath = [IO.Path]::ChangeExtension($fullName, ".$($formatType.ToString().ToLower())");
        $image.Save($filePath, $formatType);
        $image.Dispose();
    }
    end {
        Write-Verbose "Conversion done"
    }
}