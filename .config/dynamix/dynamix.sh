#! zsh

tmpfolder=$(mktemp -d)

nix eval -f default.nix --write-to ~/out
cp -a ~/out/. ~/
rm -r ~/out
