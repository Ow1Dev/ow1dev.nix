{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    extraConfig = ''
      set-option -a terminal-overrides ",*256col*:RGB"
      bind-key C-n command-prompt -p "New session name:" "new-session -s '%%'"
      '';
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.nord;
      }
    ];
  };
}
