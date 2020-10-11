# Try uncommenting the following line if you receive errors about a missing assembly
# [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function ConvertTo-Jpg {
    <#
.SYNOPSIS
Converts input to an JGP image with given compression level

.DESCRIPTION
Converts input file to an JPG image. Compression level can be specified

.PARAMETER Files
Input files

.PARAMETER Quality
JPEG quality level 0 - 100 (inclusive bounds)

.EXAMPLE
Get-ChildItem . -Filter *.gif | ConvertTo-Jpg -Quality 95
Creates JPG images for all gifs from current location with quality set to 95

.EXAMPLE
Get-Item .\1.gif | ConvertTo-Jpg -Quality 60
Creates JPG image from '1.gif' file with quality set to 60

#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true)]
        $Files,
        [int]
        [Parameter(Mandatory = $false, Position = 1)]
        $Quality = 100
    )

    begin {
        Write-Verbose "Conversion start"
        $qualityEncoder = [System.Drawing.Imaging.Encoder]::Quality
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
        # Set JPEG quality level here: 0 - 100 (inclusive bounds)
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($qualityEncoder, $Quality)
        $jpegCodecInfo = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | where { $_.MimeType -eq 'image/jpeg' }
    }
    process {
        $Files | % {
            $fullName = $_.Fullname
            $image = [System.Drawing.Image]::FromFile($fullName)
            $filePath = "{0}\{1}.jpg" -f $($_.DirectoryName), $($_.BaseName)
            $image.Save($filePath, $jpegCodecInfo, $encoderParams)
            $image.Dispose()
        }
    }
    end {
        Write-Verbose "Conversion done"
    }
}