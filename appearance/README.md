# Terminal appearances

### Prerequisites

Make sure the following are installed:
- Windows Terminal
- Powershell 7
- WSL + Ubuntu
- oh-my-posh
- posh-git
- Meslo LG M Regular NF (can be found in the .zip file in this folder)

## Windows Terminal 

Not much changes for Windows Terminal. Just simply add the following lines to the `defaults` section of `settings.json`:

```json
"fontFace": "MesloLGM NF",
"colorScheme": "One Half Dark",
"suppressApplicationTitle": true
```

## oh-my-posh

My profile for oh-my-posh is like a mix between `emodipt` and `negligible` with some minor updates and this is what it looks like on Windows 11. In Wsl it would say `WSL` instead of `W11`.

![What the profile looks like](posh-profile.png)

### Usage 

**Powershell**

To make powershell pick up the oh-my-posh profile we need to add a line to one of the powershell profiles. To list all profiles for your current powershell instance simply run `$PROFILE | Format-List -Force`. The following two lines need to appear in at least one the listed profiles:

- `Import-Module posh-git`
- `oh-my-posh --init --shell pwsh --config <absolute/path/to/profile.omp.json> | Invoke-Expression`

**WSL Ubuntu** 

Add the following line to your `~/.profile`: `eval "$(oh-my-posh-wsl --init --shell bash --config <absolute/path/to/profile.omp.json>)"`

