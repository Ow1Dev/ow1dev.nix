{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../home/zsh.nix
    ../home/zoxide.nix
    ../home/tmux.nix
    ../home/git.nix
    ../home/nixvim
    ../home/direnv.nix
  ];

  # add home-manager user settings here
  home.username = lib.mkDefault "ow1";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.packages = with pkgs; [
    nodejs
    ripgrep
    libgcc
  ];

  home.stateVersion = "24.11";
}
