./install.ps1

$profileScript = ". `"" + $PSScriptRoot + "\profile.ps1`""
Add-Content -path $PROFILE $profileScript