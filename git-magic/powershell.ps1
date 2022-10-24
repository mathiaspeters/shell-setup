function Git-Push {
    git push -u origin HEAD
}

function Git-Pull {
    git pull --no-edit
}

function Git-Rebase {
    git fetch
    git rebase
}

function Git-Commit {
    param (
        [parameter(Mandatory=$true)]
        [String]$CommitMessage
    )
    git add .
    git commit -m $CommitMessage
}

function Git-Checkout {
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter({
            param($pCmd, $pParam, $pWord, $pAst, $pFakes)

            $branchList = (git branch --format='%(refname:short)')

            if ([string]::IsNullOrWhiteSpace($pWord)) {
                return $branchList;
            }

            $branchList | Select-String "$pWord"
        })]
        [string] $BranchName
    )
    git checkout $BranchName
    pull
}

function Git-NewBranch {
    param (
        [parameter(Mandatory=$true)]
        [String]$BranchName
    )
    git checkout -b $BranchName
}

function Git-Update {
    param (
        [parameter(Mandatory=$false)]
        [ArgumentCompleter({
            param($pCmd, $pParam, $pWord, $pAst, $pFakes)

            $branchList = (git branch --format='%(refname:short)')

            if ([string]::IsNullOrWhiteSpace($pWord)) {
                return $branchList;
            }

            $branchList | Select-String "$pWord"
        })]
        [String]$ParentBranch
    )
    $CurrentBranch=$(git branch --show-current)
    if($PSBoundParameters.ContainsKey('ParentBranch')) {
        $BaseBranch=$ParentBranch
    } else {
        $BaseBranch="main"
    }
    git checkout $BaseBranch
    pull 
    git checkout $CurrentBranch
    git merge $BaseBranch --no-edit
}

Set-Alias -Name push -Value Git-Push
Set-Alias -Name pull -Value Git-Pull
Set-Alias -Name rebase -Value Git-Rebase
Set-Alias -Name commit -Value Git-Commit
Set-Alias -Name gcb -Value Git-NewBranch
Set-Alias -Name gco -Value Git-Checkout 
Set-Alias -Name gup -Value Git-Update

function List-Profiles {
    $PROFILE | Format-List -Force
}

function Edit-Profile {
    code $PROFILE
}