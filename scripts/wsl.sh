#!/usr/bin/env zsh
set -euo pipefail

if ! [[ -d /mnt/wsl ]]; then
    exit
fi

echo "Linking WSL scripts"

for d in /mnt/c/Users/*/.glaze-wm; do
    echo "Copying Glaze config to $d"
    cp ~/dotfiles/wsl/glaze-wm/config.yaml $d/
done

for f in /mnt/c/Users/*/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json; do
    echo "Copying Windows Terminal settings to $f"
    cp ~/dotfiles/wsl/windows-terminal/settings.json $f
done
