{
  config,
  lib,
  ...
}: {
  imports = [
    ../home/zoxide.nix
    ../home/nushell.nix
    ../home/git.nix
    ../home/neovim.nix
    ../home/direnv.nix
  ];

  # add home-manager user settings here
  home.username = lib.mkDefault "ow1";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.11";
}
