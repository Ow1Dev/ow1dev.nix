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
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      format = lib.strings.concatStrings [
        "$container"
        "$nix_shell"
        "$os"
        "$directory"
        "$c"
        "$status"
        "\n$character"
      ];
      add_newline = true;
      container = {
        format = "[   ](fg:red red)";
      };
      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[   ](fg:blue bold)";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
