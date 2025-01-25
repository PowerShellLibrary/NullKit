
## Add-ToStartup

### .SYNOPSIS

Script for adding items to system startup

### .SYNTAX

```PowerShell
Add-ToStartup [-ItemPath] <String> [[-ComputerConfiguration]] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### .DESCRIPTION

With this cmdlet you can add items to startup. You can add items for a current user or computer/all users

### .PARAMETERS

### `-ItemPath`

Specifies the path to an item.

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-ComputerConfiguration`

Specifies whether item should be added to the computer/all users startup folder

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **DefaultValue**:   | False           |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | 2               |
| **Required**:       | false           |

### `-WhatIf`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

### `-Confirm`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
Add-ToStartup -ItemPath C:\Windows\System32\notepad.exe
```

### Example 2

```PowerShell
Add-ToStartup -ComputerConfiguration -ItemPath C:\Windows\System32\notepad.exe
```

## Clear-VisualStudioSolution

### .SYNOPSIS

Solution cleanup

### .SYNTAX

```PowerShell
Clear-VisualStudioSolution [-StartPath] <String> [<CommonParameters>]
```

### .DESCRIPTION

Runs cleanup on all projects in a given directory

### .PARAMETERS

### `-StartPath`

Start directory

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

## Examples

### Example 1

```PowerShell
Clear-VisualStudioSolution -StartPath "C:\repo\XA\src\"
```

## Convert-StringToTimeSpan

### .SYNOPSIS

Converts string to TimeSpan

### .SYNTAX

```PowerShell
Convert-StringToTimeSpan [[-String] <String>] [<CommonParameters>]
```

### .DESCRIPTION

Converts input string to timespan object

### .PARAMETERS

### `-String`

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Convert-StringToTimeSpan "00:00:00.0040507"
```

## ConvertTo-Image

### .SYNOPSIS

Converts input to an image

### .SYNTAX

```PowerShell
ConvertTo-Image [[-Files] <Object>] [-Format] {MemoryBMP | Bmp | Emf | Wmf | Jpeg | Png | Gif | Tiff | Exif | PhotoCD | Icon} [<CommonParameters>]
```

### .DESCRIPTION

Converts input file to an image. Supported output types: MemoryBMP, Bmp , Emf, Wmf, Jpeg, Png, Gif, Tiff, Exif, PhotoCD, Icon

### .PARAMETERS

### `-Files`

Input files

|                     |                |
| ------------------- | :------------- |
| **Type**:           | Object         |
| **ParameterValue**: | Object         |
| **PipelineInput**:  | true (ByValue) |
| **Position**:       | 1              |
| **Required**:       | false          |

### `-Format`

Output Image format type

|                    |             |
| ------------------ | :---------- |
| **Type**:          | ImageFormat |
| **PipelineInput**: | false       |
| **Position**:      | 2           |
| **Required**:      | true        |

## Examples

### Example 1

```PowerShell
Get-ChildItem C:\test -Filter "*.gif" | ConvertTo-Image -Format Png
```

## ConvertTo-Png

### .SYNOPSIS

Converts input to an PNG image

### .SYNTAX

```PowerShell
ConvertTo-Png [<CommonParameters>]
```

### .DESCRIPTION

Converts input file to an PNG image

## Examples

### Example 1

```PowerShell
Get-ChildItem C:\test -Filter "*.gif" | ConvertTo-Png
```

## Expand-Emoji

### .SYNOPSIS

Unicode emoji to string

### .SYNTAX

```PowerShell
Expand-Emoji [-String] <String> [<CommonParameters>]
```

### .DESCRIPTION

Expands unicode emoji deifinition to normal encoding

### .PARAMETERS

### `-String`

Input string

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

## Examples

### Example 1

```PowerShell
Expand-Emoji "Hey. This is emoji test \uD83D\uDE42"
```

## Get-Base64

### .SYNOPSIS

File to Base64

### .SYNTAX

```PowerShell
Get-Base64 [-FilePath] <Object> [<CommonParameters>]
```

### .DESCRIPTION

Script creates a new file with ".b64" extension and fill its content with Base64String of a file content/bytes

### .PARAMETERS

### `-FilePath`

Full path of a file.

|                     |        |
| ------------------- | :----- |
| **Type**:           | Object |
| **ParameterValue**: | Object |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

## Examples

### Example 1

```PowerShell
Get-Base64 test.txt
```

## Get-CmdletTemplate

### .SYNOPSIS

[PURPOSE OF CMDLET]

### .SYNTAX

```PowerShell
Get-CmdletTemplate [[-Arg1] <String>] [[-Arg2] <FileInfo[]>] [<CommonParameters>]
```

### .DESCRIPTION

[SHORT DESCRIPTION]

### .PARAMETERS

### `-Arg1`

[PURPOSE OF Arg1]

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

### `-Arg2`

[PURPOSE OF Arg2]

|                     |            |
| ------------------- | :--------- |
| **Type**:           | FileInfo[] |
| **ParameterValue**: | FileInfo[] |
| **PipelineInput**:  | false      |
| **Position**:       | 2          |
| **Required**:       | false      |

## Examples

### Example 1

```PowerShell
Get-CmdletTemplate 1 2
```

## Get-CommonString

### .SYNOPSIS

Gets common part of two strings

### .SYNTAX

```PowerShell
Get-CommonString [-Word1] <String> [-Word2] <String> [<CommonParameters>]
```

### .DESCRIPTION

Searches for common part of two strings, starting from the beginning

### .PARAMETERS

### `-Word1`

First word

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-Word2`

Second Word

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 2      |
| **Required**:       | true   |

## Examples

### Example 1

```PowerShell
Get-CommonString  "website" "web"
```

## Get-DirStat

### .SYNOPSIS

Gets folders report

### .SYNTAX

```PowerShell
Get-DirStat [[-Path] <String>] [<CommonParameters>]
```

### .PARAMETERS

### `-Path`

Folder path that will be exposed via SymbolicLink

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Get-DirStat "c:\repo"
```

### Example 2

```PowerShell
Get-DirStat
```

## Get-FileHash

### .SYNOPSIS

Returns hash from a file

### .SYNTAX

```PowerShell
Get-FileHash [-FileName] <String> [[-HashName] <String>] [<CommonParameters>]
```

### .DESCRIPTION

Returns hash from a file using given hash algorithm.
Default algorithm is:  'MD5'

### .PARAMETERS

### `-FileName`

Name/path of the file to be hashed

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-HashName`

Hash algorithm name

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **DefaultValue**:   | MD5    |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 2      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Get-FileHash README.md
```

### Example 2

```PowerShell
Get-FileHash "C:\README.md"
```

### Example 3

```PowerShell
Get-FileHash README.md -HashName "sha256"
```

## Get-GodMode

### .SYNOPSIS

Get God Mode!

### .SYNTAX

```PowerShell
Get-GodMode [<CommonParameters>]
```

### .DESCRIPTION

Turns explorer window into Admin panel

## Examples

### Example 1

```PowerShell
Get-GodMode
```

## Get-InstallDate

### .SYNOPSIS

Returns system installation date.

### .SYNTAX

```PowerShell
Get-InstallDate [<CommonParameters>]
```

### .DESCRIPTION

Returns DateTime with operating system installation date. Date will change during feature updates

## Examples

### Example 1

```PowerShell
Get-Uptime
```

## Get-MergedBranchces

### .SYNOPSIS

Helper script for listing merged branches

### .SYNTAX

```PowerShell
Get-MergedBranchces [[-Branches] <String[]>] [<CommonParameters>]
```

### .DESCRIPTION

This script will return all branches names that were already merged to the current branch

### .PARAMETERS

### `-Branches`

Collection of excluded branches

|                     |                        |
| ------------------- | :--------------------- |
| **Type**:           | String[]               |
| **DefaultValue**:   | @("master", "develop") |
| **ParameterValue**: | String[]               |
| **PipelineInput**:  | false                  |
| **Position**:       | 1                      |
| **Required**:       | false                  |

## Examples

### Example 1

```PowerShell
Get-MergedBranchces
```

### Example 2

```PowerShell
Get-MergedBranchces -Branches naster,feature1
```

## Get-MergedRemoteBranchces

### .SYNOPSIS

Helper script for listing merged remote branches

### .SYNTAX

```PowerShell
Get-MergedRemoteBranchces [[-Origin] <String>] [[-Branch] <String>] [[-Branches] <String[]>] [<CommonParameters>]
```

### .DESCRIPTION

This script will return all remote branches names that were already merged to the current branch

### .PARAMETERS

### `-Origin`

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **DefaultValue**:   | origin |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

### `-Branch`

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **DefaultValue**:   | master |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 2      |
| **Required**:       | false  |

### `-Branches`

Collection of excluded branches

|                     |                                |
| ------------------- | :----------------------------- |
| **Type**:           | String[]                       |
| **DefaultValue**:   | @("master", "develop", "HEAD") |
| **ParameterValue**: | String[]                       |
| **PipelineInput**:  | false                          |
| **Position**:       | 3                              |
| **Required**:       | false                          |

## Examples

### Example 1

```PowerShell
Get-MergedRemoteBranchces
```

### Example 2

```PowerShell
Get-MergedRemoteBranchces -Branches naster,feature1
```

## Get-StringHash

### .SYNOPSIS

Returns hash from a string

### .SYNTAX

```PowerShell
Get-StringHash [-String] <String> [[-HashName] <String>] [<CommonParameters>]
```

### .DESCRIPTION

Returns hash from an input string using given hash algorithm.
Default algorithm is:  'MD5'

### .PARAMETERS

### `-String`

String to be hashed

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-HashName`

Hash algorithm name

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **DefaultValue**:   | MD5    |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 2      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Get-StringHash "test"
```

### Example 2

```PowerShell
Get-StringHash 'test' -HashName "sha256"
```

## Get-Uptime

### .SYNOPSIS

Information about system run time

### .SYNTAX

```PowerShell
Get-Uptime [<CommonParameters>]
```

### .DESCRIPTION

Returns and TimeSpan object with run time information. It check the last day when system was booted and compares it with localdate

## Examples

### Example 1

```PowerShell
Get-Uptime
```

### Example 2

```PowerShell
Get-Uptime | Select-Object -Property TotalHours
```

## Join-TsFile

### .SYNOPSIS

Helper script for concatenating .ts files

### .SYNTAX

```PowerShell
Join-TsFile [[-FilesLocation] <String>] [[-Files] <FileInfo[]>] [[-OutFile] <String>] [<CommonParameters>]
```

### .DESCRIPTION

This script will join *.ts files from a given directory or list of files passed as an argument

### .PARAMETERS

### `-FilesLocation`

Location of the folder where your DLLs live.

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

### `-Files`

Location of the folder where your DLLs live.

|                     |            |
| ------------------- | :--------- |
| **Type**:           | FileInfo[] |
| **ParameterValue**: | FileInfo[] |
| **PipelineInput**:  | false      |
| **Position**:       | 2          |
| **Required**:       | false      |

### `-OutFile`

Location of the folder where your DLLs live.

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **DefaultValue**:   | out.ts |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 3      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Join-TsFile "c:\test\"
```

### Example 2

```PowerShell
Join-TsFile -Files (gci "c:\test\2")
```

## New-Documentation

### .SYNOPSIS


New-Documentation [-ModuleName] <string> [[-OutputFolderPath] <string>] [<CommonParameters>]


### .SYNTAX

```PowerShell
syntaxItem
----------
{@{name=New-Documentation; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```

### .PARAMETERS

### `-ModuleName`

|                     |        |
| ------------------- | :----- |
| **Type**:           | string |
| **ParameterValue**: | string |
| **PipelineInput**:  | false  |
| **Position**:       | 0      |
| **Required**:       | true   |

### `-OutputFolderPath`

|                     |        |
| ------------------- | :----- |
| **Type**:           | string |
| **ParameterValue**: | string |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## New-FolderJunction

### .SYNOPSIS

Helper script for creating SymbolicLink aka folder junction

### .SYNTAX

```PowerShell
New-FolderJunction [-Source] <String> [-Destination] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### .PARAMETERS

### `-Source`

Folder path that will be exposed via SymbolicLink

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-Destination`

Location of the SymbolicLink (endpoint)

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 2      |
| **Required**:       | true   |

### `-WhatIf`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

### `-Confirm`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
New-FolderJunction "c:\repo\serialization" "c:\sites\website1\Data\serialization"
```

## New-TempFile

### .SYNOPSIS

Linq.Enumerable.SkipWhile Method for PowerShell

### .SYNTAX

```PowerShell
New-TempFile [<CommonParameters>]
```

### .DESCRIPTION

Skips all the items until first will be valid for a predicator

## Examples

### Example 1

```PowerShell
Î»  "a","aa","aaa" | New-TempFile { $_.Length -lt 3 }
```

### Example 2

```PowerShell
Î»  1..10 | New-TempFile { $_ -ne 8 }
```

## Remove-Comments

### .SYNOPSIS


Remove-Comments [-File] <FileInfo> [-WhatIf] [-Confirm] [<CommonParameters>]


### .SYNTAX

```PowerShell
syntaxItem
----------
{@{name=Remove-Comments; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```

### .PARAMETERS

### `-Confirm`

|                    |        |
| ------------------ | :----- |
| **Type**:          | switch |
| **PipelineInput**: | false  |
| **Position**:      | Named  |
| **Required**:      | false  |

### `-File`

|                     |          |
| ------------------- | :------- |
| **Type**:           | FileInfo |
| **ParameterValue**: | FileInfo |
| **PipelineInput**:  | false    |
| **Position**:       | 0        |
| **Required**:       | true     |

### `-WhatIf`

|                    |        |
| ------------------ | :----- |
| **Type**:          | switch |
| **PipelineInput**: | false  |
| **Position**:      | Named  |
| **Required**:      | false  |

## Remove-MergedBranches

### .SYNOPSIS

Helper script for removing merged branches

### .SYNTAX

```PowerShell
Remove-MergedBranches [[-Branches] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### .DESCRIPTION

This script will remove all branches which were already merged to the current branch

### .PARAMETERS

### `-Branches`

Collection of excluded from removing branches

|                     |                        |
| ------------------- | :--------------------- |
| **Type**:           | String[]               |
| **DefaultValue**:   | @("master", "develop") |
| **ParameterValue**: | String[]               |
| **PipelineInput**:  | false                  |
| **Position**:       | 1                      |
| **Required**:       | false                  |

### `-WhatIf`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

### `-Confirm`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
Remove-MergedBranches
```

### Example 2

```PowerShell
Remove-MergedBranches -Branches naster,feature1
```

## Remove-MergedRemoteBranches

### .SYNOPSIS

Helper script for removing merged remote branches

### .SYNTAX

```PowerShell
Remove-MergedRemoteBranches [[-Branches] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### .DESCRIPTION

This script will remove all remote branches which were already merged to the current branch

### .PARAMETERS

### `-Branches`

Collection of excluded from removing branches

|                     |                                |
| ------------------- | :----------------------------- |
| **Type**:           | String[]                       |
| **DefaultValue**:   | @("master", "develop", "HEAD") |
| **ParameterValue**: | String[]                       |
| **PipelineInput**:  | false                          |
| **Position**:       | 1                              |
| **Required**:       | false                          |

### `-WhatIf`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

### `-Confirm`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
Remove-MergedRemoteBranches
```

### Example 2

```PowerShell
Remove-MergedRemoteBranches -Branches naster,feature1
```

## Resolve-MsBuild

### .SYNOPSIS


Resolve-MsBuild


### .SYNTAX

```PowerShell
syntaxItem
----------
{@{name=Resolve-MsBuild; CommonParameters=False; WorkflowCommonParameters=False; parameter=System.Object[]}}
```

### .PARAMETERS

## Restart-WiFi

### .SYNOPSIS

Restats WiFi connection

### .SYNTAX

```PowerShell
Restart-WiFi [-WhatIf] [-Confirm] [<CommonParameters>]
```

### .DESCRIPTION

Check if there is any active wlan interface and restarts its connection.

### .PARAMETERS

### `-WhatIf`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

### `-Confirm`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
Restart-WiFi
```

## Skip-While

### .SYNOPSIS

Linq.Enumerable.SkipWhile Method for PowerShell

### .SYNTAX

```PowerShell
Skip-While [[-Predicate] <Object>] [<CommonParameters>]
```

### .DESCRIPTION

Skips all items until first will be valid for a predicator

### .PARAMETERS

### `-Predicate`

Predicate to be executed on an item

|                     |        |
| ------------------- | :----- |
| **Type**:           | Object |
| **ParameterValue**: | Object |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
"a","aa","aaa" | Skip-While { $_.Length -lt 3 }
```

### Example 2

```PowerShell
1..10 | Skip-While { $_ -ne 8 }
```

## Test-Any

### .SYNOPSIS

Linq.Enumerable.Any Method for PowerShell

### .SYNTAX

```PowerShell
Test-Any [[-FilterScript] <Object>] [<CommonParameters>]
```

### .DESCRIPTION

Check predicate and returns either true or false depending on the result

### .PARAMETERS

### `-FilterScript`

Predicate to be executed on an item

|                     |        |
| ------------------- | :----- |
| **Type**:           | Object |
| **ParameterValue**: | Object |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
1..4 | Test-Any { $_ -gt 5 }
```

### Example 2

```PowerShell
1..4 | Test-Any { $_ -gt 2 }
```

## Test-DLL

### .SYNOPSIS

Helper script for checking DLLs

### .SYNTAX

```PowerShell
Test-DLL [-DllFolder] <String> [-CleanHost] [<CommonParameters>]
```

### .DESCRIPTION

This script displays information about every dll located in a given path

You can get information about
- FileVersion
- ProductVersion
- LegalCopyright
- BuildConfiguration
- TargetCPU
- JitOptimized flag

### .PARAMETERS

### `-DllFolder`

Location of the folder with dlls.

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | true   |

### `-CleanHost`

|                     |                 |
| ------------------- | :-------------- |
| **Type**:           | SwitchParameter |
| **DefaultValue**:   | False           |
| **ParameterValue**: | SwitchParameter |
| **PipelineInput**:  | false           |
| **Position**:       | named           |
| **Required**:       | false           |

## Examples

### Example 1

```PowerShell
Test-DLL "C:\dll" -CleanHost
```

### Example 2

```PowerShell
Test-DLL "C:\dll"
```

## Test-GitRepo

### .SYNOPSIS

Helper script for listing merged branches

### .SYNTAX

```PowerShell
Test-GitRepo [<CommonParameters>]
```

### .DESCRIPTION

This script will return all branches names that were already merged to the current branch

## Examples

### Example 1

```PowerShell
Test-GitRepo
```

## Test-GitStatus

### .SYNOPSIS

Scans git directories and displays status

### .SYNTAX

```PowerShell
Test-GitStatus [[-DirectoryPath] <String>] [<CommonParameters>]
```

### .DESCRIPTION

Scans git directories and displays git status.
It provides following information:
- OK            - if repo is clean
- NOT_GIT       - if folder is not a git repo
- HAS_WORKING   - if there are any active changes (working changes)
- STASH         - if repository has any stasches

### .PARAMETERS

### `-DirectoryPath`

Root dir containing other git repo folders

|                     |        |
| ------------------- | :----- |
| **Type**:           | String |
| **ParameterValue**: | String |
| **PipelineInput**:  | false  |
| **Position**:       | 1      |
| **Required**:       | false  |

## Examples

### Example 1

```PowerShell
Test-GitStatus
```

### Example 2

```PowerShell
Test-GitStatus c:\repo
```

