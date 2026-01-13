{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history.path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";
    initContent = ''
    n () {
      if [ -n $NNNLVL ] && [ "$NNNLVL" -ge 1 ]; then
        echo "nnn is already running"
        return
      fi

      export NNN_TMPFILE="$HOME/.config/nnn/.lastd"

      nnn -adeHo "$@"

      if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
      fi
    }
    '';
    shellAliases = {
      ll = "n";
      wt = "git worktree";
      v = "$EDITOR";
    };
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = true;
      container = {
        format = "[  ](fg:red red)";
      };
      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[  ](fg:blue bold)";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
