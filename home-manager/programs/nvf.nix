{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = false;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        enableLuaLoader = true;
        syntaxHighlighting = true;
        lineNumberMode = "number";
        useSystemClipboard = true;
        preventJunkFiles = true;

        undoFile.enable = true;
        telescope.enable = true;
        globals.editorconfig = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;

          autoindent = true;
        };

        binds = {
          cheatsheet.enable = true;
          whichKey.enable = true;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
          startify.enable = true;
        };

        mini = {
          icons.enable = true;
          statusline.enable = true;
          git.enable = true;
          diff.enable = true;
          align.enable = true;
          notify.enable = true;
          operators.enable = true;
          starter.enable = true;
          comment.enable = true;
          move.enable = true;
          pairs.enable = true;
          splitjoin.enable = true;
          bracketed.enable = true;
          indentscope.enable = true;
        };

        tabline.nvimBufferline = {
          enable = true;

          mappings = {
            cycleNext = "<leader>e";
            cyclePrevious = "<leader>q";
          };
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;

          mappings = {
            close = "<C-e>";
            complete = "<C-Space>";
            confirm = "<CR>";
            next = "<Down>";
            previous = "<Up>";
            scrollDocsDown = "<C-f>";
            scrollDocsUp = "<C-d>";
          };
        };

        comments.comment-nvim = {
          enable = true;

          mappings = {
            toggleCurrentLine = "<C-l>";
          };
        };

        debugger.nvim-dap = {
          enable = true;

          ui = {
            enable = true;
            autoStart = true;
          };
        };

        filetree.nvimTree = {
          enable = true;

          mappings = {
            toggle = "<C-n>";
          };
        };

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
              type = "nixfmt";
              package = pkgs.nixfmt-rfc-style;
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
              enable = true;
              codeActions = true;
            };
          };
        };

        snippets.luasnip.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          trouble.enable = true;
          otter-nvim.enable = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
          lspSignature.enable = true;
          lsplines.enable = true;
          nvim-docs-view.enable = true;
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };

        treesitter.context.enable = true;

        ui = {
          noice.enable = true;
        };

        visuals = {
          nvim-web-devicons.enable = true;
        };
      };
    };
  };
}
