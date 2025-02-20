{ config, lib, ... }:
{
  options = {
    nixvim-config.plugins.which-key.enable = lib.mkEnableOption "enables which-key module";
  };

  config = lib.mkIf config.nixvim-config.plugins.which-key.enable {
    programs.nixvim = {
      plugins.which-key = {
        enable = true;
        settings = {
           preset = "helix";
           show_help = false;
           show_keys = false;
           win = {
              border = "rounded";
              padding = [1 2];
              title = false;
              zindex = 1000;
           };
        };
      };
      opts = {
        timeout = true;
        timeoutlen = 300;
      };
    };
  };
}
