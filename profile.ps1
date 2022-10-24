$ohMyPoshProfile = $PSScriptRoot + "\appearance\profile.omp.json"
oh-my-posh init pwsh --config $ohMyPoshProfile | Invoke-Expression

$gitMagicScript = $PSScriptRoot + "\git-magic\powershell.ps1"
. $gitMagicScript