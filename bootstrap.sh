#!/usr/bin/env bash

if ! command -v nix &> /dev/null; then
  curl -L https://nixos.org/nix/install | sh
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

DOTFILES_DIR="$HOME/.dotfiles"
if [ -d "$DOTFILES_DIR" ]; then
  git -C "$DOTFILES_DIR" pull
else
  git clone https://github.com/Ow1Dev/ow1dev.nix "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"
nix develop --extra-experimental-features nix-command --command just switch
just switch

source ~/.bashrc || source ~/.zshrc || source ~/.profile
