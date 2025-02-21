{ config, lib, ... }:
{
  options = {
    nixvim-config.plugins.vim-dadbod.enable = lib.mkEnableOption "enables vim-dadbod module";
  };

  config = lib.mkIf config.nixvim-config.plugins.vim-dadbod.enable {
    programs.nixvim.plugins = {
      vim-dadbod.enable = true;
      vim-dadbod-completion.enable = true;
      vim-dadbod-ui.enable = true;
    };
  };
}
