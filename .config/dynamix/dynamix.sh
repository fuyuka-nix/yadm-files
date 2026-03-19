#! zsh

tmpfolder=$(mktemp -d)

nix eval -f ~/.config/dynamix/default.nix --write-to $tmpfolder/out
cp -a $tmpfolder/out/. ~/
rm -r $tmpfolder
