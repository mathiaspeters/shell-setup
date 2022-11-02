./install.sh

command='. '
pwd=`pwd` 
script="/profile.sh"
profileScript=$command$pwd$script
echo $profileScript >> ~/.profile

posh1='eval "$(oh-my-posh init bash --config '
posh2='/appearance/profile.omp.json)"'
ohMyPosh=$posh1$pwd$posh2
echo $ohMyPosh >> profile.sh

git1='. "'
git2='/git-magic/bash.sh"'
gitMagic=$git1$pwd$git2
echo $gitMagic >> profile.sh
