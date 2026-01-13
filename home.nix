{ inputs, pkgs, ... }:

{
  imports = [
     ./programs/git.nix
     ./programs/zsh.nix
     ./programs/zoxide.nix
     ./programs/nix.nix
     ./programs/tmux.nix

     inputs.ow1nvim.homeManagerModules.default
  ];

  programs.neovim-flake.enable = true;

  home.username = "ow1";
  home.homeDirectory = "/var/home/ow1";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    gh
    jq
    nnn
  ];

  home.sessionVariables = {
    TERM = "xterm-256color";
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -z "$ZSH_VERSION" ] && [ -x "$(command -v zsh)" ]; then
        exec zsh
      fi
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
