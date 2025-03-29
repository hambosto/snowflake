{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = false;
    settings = lib.mkForce {
      vim = {
        autopairs.nvim-autopairs.enable = true;

        binds = {
          cheatsheet.enable = true;
          whichKey.enable = true;
        };

        comments.comment-nvim = {
          enable = true;

          mappings = {
            toggleCurrentLine = "<C-l>";
          };
        };

        dashboard = {
          alpha.enable = true;
          dashboard-nvim.enable = true;
          startify.enable = true;
        };

        debugger.nvim-dap = {
          enable = true;

          ui = {
            autoStart = true;
            enable = true;
          };
        };

        filetree.nvimTree = {
          enable = true;

          mappings = {
            toggle = "<C-n>";
          };
        };

        globals.editorconfig = true;

        languages = {
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;

          go = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };

          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format = {
              package = pkgs.nixfmt-rfc-style;
              type = "nixfmt";
            };
            lsp.enable = true;
            treesitter.enable = true;
          };

          rust = {
            enable = false;
            dap.enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;

            crates = {
              codeActions = true;
              enable = true;
            };
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          lspSignature.enable = true;
          lspkind.enable = true;
          lsplines.enable = true;
          lspsaga.enable = true;
          nvim-docs-view.enable = true;
          otter-nvim.enable = true;
          trouble.enable = true;
        };

        mini = {
          align.enable = true;
          bracketed.enable = true;
          comment.enable = true;
          diff.enable = true;
          git.enable = true;
          icons.enable = true;
          indentscope.enable = true;
          move.enable = true;
          notify.enable = true;
          operators.enable = true;
          pairs.enable = true;
          splitjoin.enable = true;
          starter.enable = true;
          statusline.enable = true;
        };

        options = {
          autoindent = true;
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
        };

        snippets.luasnip.enable = true;

        tabline.nvimBufferline = {
          enable = true;

          mappings = {
            cycleNext = "<leader>e";
            cyclePrevious = "<leader>q";
          };
        };

        telescope.enable = true;

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        treesitter = {
          context.enable = true;
          highlight.enable = true;
          indent.enable = true;
        };

        ui.noice.enable = true;

        visuals.nvim-web-devicons.enable = true;

        viAlias = true;
        vimAlias = true;

        enableLuaLoader = true;
        lineNumberMode = "number";
        preventJunkFiles = true;
        syntaxHighlighting = true;
        undoFile.enable = true;
        useSystemClipboard = true;
      };
    };
  };
}
