pwd=`pwd` 

posh1='eval "$(oh-my-posh-wsl --init --shell bash --config '
posh2='/appearance/profile.omp.json)"'
ohMyPosh=$posh1$pwd$posh2
echo $ohMyPosh >> ~/.profile

git1='. "'
git2='/git-magic/bash.sh"'
gitMagic=$git1$pwd$git2
echo $gitMagic >> ~/.profile
