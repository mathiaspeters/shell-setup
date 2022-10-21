# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

# Unpack Fonts.zip
$source = 'Fonts.zip'
$unzipFolder = 'Fonts'
$fontsFolder = 'Fonts/Fonts'

Expand-Archive -Path $source -DestinationPath $unzipFolder

# Install fonts
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci $fontsFolder\*.ttf)
{
    $fileName = $file.Name
    $originPath = "$fontsFolder\$fileName"
    $windowsFontPath = "C:\Windows\Fonts\$fileName"
    if (-not(Test-Path -Path $windowsFontPath )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
        cp $originPath $windowsFontPath
    }
}

Remove-Item -Recurse $unzipFolder