{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        spellcheck = {
          enable = true;
        };

        lsp = {
          formatOnSave = true;
          lspkind.enable = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = true;
          lsplines.enable = true;
          nvim-docs-view.enable = true;
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          ts.enable = true;
          go.enable = true;

        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

        };

        keymaps = [
          {
            key = "<leader>e";
            mode = "n";
            silent = true;
            action = ":Neotree toggle<CR>";
          }
        ];

        statusline = {
          lualine.enable = true;
        };

        theme = {
          enable = true;
          name = "base16";
          base16-colors = {
            base00 = config.lib.stylix.colors.base00;
            base01 = config.lib.stylix.colors.base01;
            base02 = config.lib.stylix.colors.base02;
            base03 = config.lib.stylix.colors.base03;
            base04 = config.lib.stylix.colors.base04;
            base05 = config.lib.stylix.colors.base05;
            base06 = config.lib.stylix.colors.base06;
            base07 = config.lib.stylix.colors.base07;
            base08 = config.lib.stylix.colors.base08;
            base09 = config.lib.stylix.colors.base09;
            base0A = config.lib.stylix.colors.base0A;
            base0B = config.lib.stylix.colors.base0B;
            base0C = config.lib.stylix.colors.base0C;
            base0D = config.lib.stylix.colors.base0D;
            base0E = config.lib.stylix.colors.base0E;
            base0F = config.lib.stylix.colors.base0F;
          };
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
            setupOpts = {
              add_blank_line_at_top = true;
            };
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
        };

        minimap = {
          minimap-vim.enable = true;
          codewindow.enable = true;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          fastaction.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };
      };
    };
  };
}
