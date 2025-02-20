{ config, lib, ... }:
{
  options = {
    nixvim-config.plugins.telescope.enable = lib.mkEnableOption "enables telescope module";
  };

  config = lib.mkIf config.nixvim-config.plugins.telescope.enable {
    programs.nixvim = {
      plugins = {
        telescope = {
          enable = true;
          settings = {
            pickers = {
              find_files = {
                theme = "dropdown";
                previewer = false;
              };
            };
          };
        };
      };
      keymaps = [
        # Telescope stuff
        {
          key = "<C-p>";
          action = "<cmd> Telescope find_files<CR>";
          mode = "n";
          options.desc = "Find files";
        }

        {
          key = "<Leader>gsc";
          action = "<cmd> Telescope git_commits <CR>";
          mode = "n";
          options.desc = "Git show commits";
        }

        {
          key = "<Leader>fr";
          action = "<cmd> Telescope oldfiles <CR>";
          mode = "n";
          options.desc = "Find recents";
        }

        {
          key = "<Leader>fg";
          action = "<cmd> Telescope live_grep <CR>";
          mode = "n";
          options.desc = "Telescope live grep";
        }
      ];
    };
  };
}
