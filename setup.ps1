./install.ps1

$ohMyPosh = "oh-my-posh init pwsh --config " + $PSScriptRoot + "\appearance\profile.omp.json | Invoke-Expression"
Add-Content -path $PROFILE $ohMyPosh

$gitMagic = ". `"" + $PSScriptRoot + "\git-magic\powershell.ps1`""
Add-Content -path $PROFILE $gitMagic